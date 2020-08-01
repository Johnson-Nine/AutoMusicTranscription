note = 'D';
audio_file = strcat('.\music pack\single_note\',note,'.wav');
[y,Fs] = audioread(audio_file);           % Sampling frequency
L = length(y);             % Length of signal
X = y(:,1);                % stereo to mono
Y = fft(X);                % Fourier Transform of the signal

% f = 1:L/2;               % the frequence of label, half of Y is enough to show the information.
% �������Ƶ�׺���f�ķ��������⣬��������ȷ����
% 1.����Ƶ�ʷֱ��ʣ�Ƶ�ʷֱ��������� fft ��ʱ�䳤��t�ĵ������� fr = 1/t;
%   ���ղ�������� t = L/Fs, ��fr = Fs/L.
fr = Fs/L;                 % frequency resolution

% 2.����Ƶ�ʷֱ��ʣ�Ҳ����ÿ���� fft ����֮���Ƶ�ʲ�;
%   2.1 ע��������һ��ֵ�� 0 ������ 1��0 ��ֱ������
%   2.2 ͬʱע�� f �� floor(L/2)+1��ֵ��Ҳ����˵�����3��ֵ���������ȡǰ����������2�͵�3�ǶԳƵģ�
%       �����8��ֵ����ȡǰ���ֵ��5��6��4��7��3��8λ�õķ������ǶԳƵģ�����Դ� DFT ��ʽ��֤��
%       ����ֱ���� matlab ���ұ༸�������� fft ��ȡ��ֵ���۲���һ���ֵ�Ǵ����￪ʼ�ԳƵ�
f = (0:floor(L/2)).*fr;     % the frequence of label, half of Y is enough to show the information.

% Y = Y./L*2;               % calculate the amplitude of Fourier Transform of the signal
% ��������ΪʲôҪ/L*2����Ȼ֮������ǰL/2���������Ҫƽ��Ӧ�ó���L��������L/2�����߲�ƽ��ֱ�ӻ�Ҳ����
Y = Y./L;                   % calculate the amplitude of Fourier Transform of the signal

% ��ʱ������Ƶ�׺������Ӧ�ľ�����ʵƵ����
% draw the curve
plot(f,abs(Y(1:floor(L/2)+1)));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('���');
title(note);
