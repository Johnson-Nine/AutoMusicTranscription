clc;clear all;close all;

file='C:\Users\Lenovo\Desktop\music_transcrition\music pack\piano single note\little star.wav'; %文件路径，可更改。
[x,fs]=audioread(file);         %读取
x=x(:,1);                       %取单声道
x=x-mean(x); x=x./max(abs(x));  %归一化
wlen=fs*3/100;inc=fs/100;       %wlen帧长，inc帧移
win=boxcar(wlen);               %窗函数，boxcar矩形窗，hanning汉宁窗
y=enframe(x,win,inc)';         %分帧，一列为一帧
fn=size(y,2);                   %帧数

%自相关函数求周期
p=zeros(1,fn);f0=zeros(0,fn);
for i=1:fn              
    r=xcorr(y(:,i), 'coeff');
    r=r( wlen:end );
    fu=fft(y(:,i));
    %[fmax floc]=max(abs(fu));
    %f_estimate=floc*fs/wlen;               %傅里叶估计频率
    %lmax=fix(f_estimate+100);lmin=fix(f_estimate-100);  %在估计频率±200中寻找准确值
    lmin=fix(fs/1000);lmax=fix(fs/200);
    [tmax,tloc]=max(r(lmin:lmax));      %tamx为最大值，tloc为最大值索引
    p(i)=lmin+tloc-1;
end
Tindex=find(p~=0);                %找到p~=0的索引
f0(Tindex)=fs./p(Tindex);         % 求出基音频率F0
t = ((1:length(x))-1)/fs;         %样点数对应时间
frameTime = (((1:fn)-1)*inc+wlen/2)/fs; %每帧对应时间
% 画图
figure 
plot(t,x);xlabel('样点数');ylabel('幅值');title('波形');

figure
subplot 211
plot(frameTime,p);xlabel('时间/s');ylabel('样点数');title('周期');
subplot 212
plot(frameTime,f0);xlabel('时间/s');ylabel('频率/hz');title('音乐频率');

function f=enframe(x,win,inc)   %分帧
len=length(x(:));            % 取数据长度
wlen=length(win);           % 取窗长
fn = fix((len-wlen+inc)/inc); % 计算帧数
f=zeros(fn,wlen);            % 初始化
for i=1:fn                   
        f(i,1:wlen)=x((inc*i-inc+1):(inc*i+wlen-inc)).*win;
end
end