clc;clear all;close all;

file='C:\Users\Lenovo\Desktop\music_transcrition\music pack\piano single note\little star.wav'; %�ļ�·�����ɸ��ġ�
[x,fs]=audioread(file);         %��ȡ
x=x(:,1);                       %ȡ������
x=x-mean(x); x=x./max(abs(x));  %��һ��
wlen=fs*3/100;inc=fs/100;       %wlen֡����inc֡��
win=boxcar(wlen);               %��������boxcar���δ���hanning������
y=enframe(x,win,inc)';         %��֡��һ��Ϊһ֡
fn=size(y,2);                   %֡��

%����غ���������
p=zeros(1,fn);f0=zeros(0,fn);
for i=1:fn              
    r=xcorr(y(:,i), 'coeff');
    r=r( wlen:end );
    fu=fft(y(:,i));
    %[fmax floc]=max(abs(fu));
    %f_estimate=floc*fs/wlen;               %����Ҷ����Ƶ��
    %lmax=fix(f_estimate+100);lmin=fix(f_estimate-100);  %�ڹ���Ƶ�ʡ�200��Ѱ��׼ȷֵ
    lmin=fix(fs/1000);lmax=fix(fs/200);
    [tmax,tloc]=max(r(lmin:lmax));      %tamxΪ���ֵ��tlocΪ���ֵ����
    p(i)=lmin+tloc-1;
end
Tindex=find(p~=0);                %�ҵ�p~=0������
f0(Tindex)=fs./p(Tindex);         % �������Ƶ��F0
t = ((1:length(x))-1)/fs;         %��������Ӧʱ��
frameTime = (((1:fn)-1)*inc+wlen/2)/fs; %ÿ֡��Ӧʱ��
% ��ͼ
figure 
plot(t,x);xlabel('������');ylabel('��ֵ');title('����');

figure
subplot 211
plot(frameTime,p);xlabel('ʱ��/s');ylabel('������');title('����');
subplot 212
plot(frameTime,f0);xlabel('ʱ��/s');ylabel('Ƶ��/hz');title('����Ƶ��');

function f=enframe(x,win,inc)   %��֡
len=length(x(:));            % ȡ���ݳ���
wlen=length(win);           % ȡ����
fn = fix((len-wlen+inc)/inc); % ����֡��
f=zeros(fn,wlen);            % ��ʼ��
for i=1:fn                   
        f(i,1:wlen)=x((inc*i-inc+1):(inc*i+wlen-inc)).*win;
end
end