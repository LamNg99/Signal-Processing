% C. Filter Design

load chirp.mat;
filename = 'chirp.wav';
audiowrite(filename,y,Fs);
clear y Fs
[y,fs] = audioread('chirp.wav');

% C.1

N_0 = length(y); % Number of samples
T_0 = N_0/fs; % Duration of the signal
T = 1/fs; % Sampling interval

f = (0:N_0-1)/(T*N_0);
t = linspace(0, T_0, N_0);

% Compute DFT of signal y 
Y = fftshift(fft(y));

% Create a rect filter that only passes frequencies less than 2000(Hz)
H1 = abs(f-fs/2) < 2000;
% Apply the filter 
Y1_filtered = Y.*transpose(H1);
% Signal y after filtered
y1_filtered = real((ifft(fftshift(Y1_filtered))));

figure;
subplot(2,1,1);
plot(f-fs/2,abs(Y1_filtered));
grid;
title('Filtered audio in frequency domain');
xlabel('Frequency');
ylabel('Magnitude Spectrum');

subplot(2,1,2);
plot(t,y1_filtered);
grid;
title('Filtered audio in time domain');
xlabel('t');
ylabel('y_1(t)');

% C.2
% sound(y1_filtered, fs)

% The frequencies higher than +-2kHz got removed, so parts of the audio
% that contained those frequency component went silent.

% C.3

% Create a filter that cuts the bass frequencies
H2 = ~(abs(f-fs/2) > 16 & abs(f-fs/2) < 256);
% Apply the filter 
Y2_filtered = Y.*transpose(H2);
% Signal y after filtered
y2_filtered = real((ifft(fftshift(Y2_filtered))));

figure;
subplot(2,1,1);
plot(f-fs/2,abs(Y2_filtered));
grid;
title('Filtered audio in frequency domain');
xlabel('Frequency');
ylabel('Magnitude Spectrum');

subplot(2,1,2);
plot(t,y2_filtered);
grid;
title('Filtered Audio in Time Domain');
xlabel('t');
ylabel('y_2(t)');

% sound(y2_filtered, fs)

% The low frequencies/bass sounds were removed, and replaced with silence.

% C.4

% Create a filter that amplifies treble frequencies
H3 = abs(f-fs/2) > 2048 & abs(f-fs/2) < 16384;
% Apply the filter 
Y3_filtered = Y + Y.*transpose(H3)*0.25;
% Signal y after filtered
y3_filtered = real((ifft(fftshift(Y3_filtered))));

figure;
subplot(2,1,1);
plot(f-fs/2,abs(Y3_filtered));
grid;
title('Filtered audio in frequency domain');
xlabel('Frequency');
ylabel('Magnitude Spectrum');

subplot(2,1,2);
plot(t,y3_filtered);
grid;
title('Filtered audio in time domain');
xlabel('t');
ylabel('y_3(t)');

% sound(y3_filtered, fs)

% The parts of audio where contain treble frequencies were amplified 
% and got louder.

% C.5

% In task (4), the linearity property of DFT was used which first filtered
% out the treble frequencies and multiplied by 25%. This version of treble 
% frequencies was added back to the original audio spectrum. Therefore,
% it creates a new audio amplified by 25% at treble frequencies.
