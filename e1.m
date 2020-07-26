[y,Fs] = audioread('C.wav');           % Sampling frequency
T = 1/Fs;             % Sampling period
L = length(y);             % Length of signal
t = (0:L-1)*T;        % Time vector
X = y(:,1); 
Y = fft(X);
YP = pwelch(X);% Fourier Transform of the signal
f = 1:L/2;            % the frequence of label                % half of Y is enough to show the information.
Y = Y./L*2;           % calculate the amplitude of Fourier Transform of the signal
%draw the curve
subplot(1,5,1)
plot(f,abs(Y(1:floor(L/2))));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('Õñ·ù');
title("C")

subplot(1,5,1)
plot(f,abs(Y(1:floor(L/2))));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('Õñ·ù');
title("C")

[y,Fs] = audioread('D.wav');           % Sampling frequency
T = 1/Fs;             % Sampling period
L = length(y);             % Length of signal
t = (0:L-1)*T;        % Time vector
X = y(:,1); %there are some noise mixing in the signal.
Y = fft(X);           % Fourier Transform of the signal
f = 1:L/2;            % the frequence of label                % half of Y is enough to show the information.
Y = Y./L*2;           % calculate the amplitude of Fourier Transform of the signal
%draw the curve
subplot(1,5,2)
plot(f,abs(Y(1:floor(L/2))));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('Õñ·ù');
title("D")

[y,Fs] = audioread('E.wav');           % Sampling frequency
T = 1/Fs;             % Sampling period
L = length(y);             % Length of signal
t = (0:L-1)*T;        % Time vector
X = y(:,1); %there are some noise mixing in the signal.
Y = fft(X);           % Fourier Transform of the signal
f = 1:L/2;            % the frequence of label                % half of Y is enough to show the information.
Y = Y./L*2;           % calculate the amplitude of Fourier Transform of the signal
%draw the curve
subplot(1,5,3)
plot(f,abs(Y(1:floor(L/2))));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('Õñ·ù');
title("E")

[y,Fs] = audioread('F.wav');           % Sampling frequency
T = 1/Fs;             % Sampling period
L = length(y);             % Length of signal
t = (0:L-1)*T;        % Time vector
X = y(:,1); %there are some noise mixing in the signal.
Y = fft(X);           % Fourier Transform of the signal
f = 1:L/2;            % the frequence of label                % half of Y is enough to show the information.
Y = Y./L*2;           % calculate the amplitude of Fourier Transform of the signal
%draw the curve
subplot(1,5,4)
plot(f,abs(Y(1:floor(L/2))));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('Õñ·ù');
title("F")

[y,Fs] = audioread('G.wav');           % Sampling frequency
T = 1/Fs;             % Sampling period
L = length(y);             % Length of signal
t = (0:L-1)*T;        % Time vector
X = y(:,1); %there are some noise mixing in the signal.
Y = fft(X);           % Fourier Transform of the signal
f = 1:L/2;            % the frequence of label                % half of Y is enough to show the information.
Y = Y./L*2;           % calculate the amplitude of Fourier Transform of the signal
%draw the curve
subplot(1,5,5)
plot(f,abs(Y(1:floor(L/2))));% show the Fourier Transform of the signal
xlabel('Hz');
ylabel('Õñ·ù');
title("G")