% B. Sampling

load chirp.mat;
filename = 'chirp.wav';
audiowrite(filename,y,Fs);
clear y Fs
[y,fs] = audioread('chirp.wav');

% B.1
N_0 = length(y); % Number of samples
T_0 = N_0/fs; % Duration of the signal
T = 1/fs; % Sampling interval

% B.2

t = linspace(0, T_0, N_0);

figure;
subplot(2,1,1);
plot(t, y);
grid;
title('Signal y with respect to time');
xlabel('t');
ylabel('y(t)');

% B.3

f = linspace(-fs/2, fs/2, N_0);
% Compute DFT of signal y 
Y = fft(y);

subplot(2,1,2);
plot(f, abs(fftshift(Y))); 
grid;
title('DFT of Signal y');
xlabel('Frequency');
ylabel('Magnitude Spectrum');

% B.4

% Subsampled signal y1 from signal y with rate "2"
y1 = y(1:2:length(y));

fs1 = fs/2; % Sampling frequency
N_1 = length(y1); % Number of samples
T_1 = N_1/fs1; % Duration of the signal
T1 = 1/fs1; % Sampling interval

% B.5

t1 = linspace(0, T_1, N_1);

figure;
subplot(2,1,1);
plot(t1, y1);
grid;
title('Signal y_1 with respect to time');
xlabel('t_1');
ylabel('y_1(t)');

% B.6

f1 = linspace(-fs1/2, fs1/2, N_1);
% Compute DFT of signal y 
Y1 = fft(y1);

subplot(2,1,2);
plot(f1, abs(fftshift(Y1))); 
grid;
title('DFT of Signal y_1');
xlabel('Frequency');
ylabel('Magnitude Spectrum');

figure;
plot(t, y, t1, y1);
grid;
title('Compare y and y_1 with respect to time');
xlabel('Time');
ylabel('Audio Signal');
legend('Signal y','Signal y_1');
axis([0.005 0.01 -0.6 0.6]);

% The audio signal after downsampling by factor of "2" has lost half 
% of the sample and cannot capture all the information of the original
% signal. In addition, the downsampling spectrum has its amplitude
% and frequency axis scaled by the factor of 1/2.

% B.7

% sound(y, fs)
% sound(y1, fs1)

% The audio after subsampling is slightly different as it is unable to
% obtain all information of the original audio with half of the samples.

% B.8

% Subsampled signal y1 from signal y with rate "5"
y5 = y(1:5:length(y));

fs5 = fs/5; % Sampling frequency
N_5 = length(y5); % Number of samples
T_5 = N_5/fs5; % Duration of the signal
T5 = 1/fs5; % Sampling interval

t5 = linspace(0, T_5, N_5);

figure;
subplot(2,1,1);
plot(t5, y5);
grid;
title('Signal y_5 with respect to time');
xlabel('t_5');
ylabel('y_5(t)');

f5 = linspace(-fs5/2, fs5/2, N_5);
% Compute DFT of signal y 
Y5 = fft(y5);

subplot(2,1,2);
plot(f5, abs(fftshift(Y5))); 
grid;
title('DFT of Signal y_5');
xlabel('Frequency');
ylabel('Magnitude Spectrum');

figure;
plot(t, y, t5, y5);
grid;
title('Compare y and y_5 with respect to time');
xlabel('Time');
ylabel('Audio Signal');
legend('Signal y', 'Signal y_5');
axis([0.005 0.01 -0.6 0.6]);

% sound(y5, fs5)

% The audio signal after downsampling by factor of "5" has lost one 
% fifth of the sample. Hence, the downsampling signal is dramatically
% different from the actual signal as it has too few samples to recover 
% all original information. Additionally, the downsampling spectrum has 
% its amplitude and frequency axis scaled by the factor of 1/5.
