note = 'D';
audio_file = strcat('.\music pack\single_note\',note,'.wav');
[y,Fs] = audioread(audio_file);           % Sampling frequency
L = length(y);             % Length of signal
X = y(:,1);                % stereo to mono
Y = fft(X);                % Fourier Transform of the signal

% f = 1:L/2;               % the frequence of label, half of Y is enough to show the information.
% 上面计算频谱横轴f的方法有问题，下面是正确方法
% 1.计算频率分辨率，频率分辨率是用于 fft 的时间长度t的倒数，即 fr = 1/t;
%   按照采样点计算 t = L/Fs, 故fr = Fs/L.
fr = Fs/L;                 % frequency resolution

% 2.代入频率分辨率，也就是每两个 fft 数据之间的频率差;
%   2.1 注意横坐标第一个值是 0 而不是 1，0 是直流分量
%   2.2 同时注意 f 有 floor(L/2)+1个值，也就是说如果有3个值，则幅度谱取前两个，而第2和第3是对称的，
%       如果有8个值，则取前五个值，5和6，4和7，3和8位置的幅度谱是对称的，这可以代 DFT 公式验证，
%       或者直接在 matlab 中乱编几个数字做 fft 后取幅值，观察这一组幅值是从哪里开始对称的
f = (0:floor(L/2)).*fr;     % the frequence of label, half of Y is enough to show the information.

% Y = Y./L*2;               % calculate the amplitude of Fourier Transform of the signal
% 不明白你为什么要/L*2，虽然之画出了前L/2，但是如果要平均应该除以L，而不是L/2，或者不平均直接画也可以
Y = Y./L;                   % calculate the amplitude of Fourier Transform of the signal

% 此时画出的频谱横坐标对应的就是真实频率了
% draw the curve
plot(f,abs(Y(1:floor(L/2)+1)));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('振幅');
title(note);
