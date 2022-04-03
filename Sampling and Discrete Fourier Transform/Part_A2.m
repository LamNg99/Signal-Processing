% A. Discrete Fourier Transform and zero padding

% A.2

n = 0:9; % 10 samples

% Signal x[1] and x[2]
x1 = (exp(j*2*pi*n*(30/100))) + (exp(j*2*pi*n*(33/100)));
x2 = (cos(2*pi*n*(30/100))) + (0.5*cos(2*pi*n*(40/100)));

% Zero-pad the signals x1[n] and x2[n] with 490 zeros
x1 = [x1,zeros(1,490)];
x2 = [x2,zeros(1,490)];

% Compute Discrete Fourier Transform for both signals
X1 = fft(x1); 
X2 = fft(x2);

N = length(x1); % length(x1) = length(x2) = 500
fr = (0:N-1)/N;

figure;
subplot(2,1,1);
stem(fr-0.5,abs(fftshift(X1)));
grid;
title('DFT of 10-point x_1[n] zero-padded to 500 points');
xlabel('f_r');
ylabel('X_1(f_r)');
axis([-0.5 0.5 0 20]);

subplot(2,1,2);
stem(fr-0.5,abs(fftshift(X2)));
grid;
title('DFT of 10-point x_2[n] zero-padded to 500 points');
xlabel('f_r');
ylabel('X_2(f_r)');
axis([-0.5 0.5 0 6]);

% Zero-padding increases the pickets in the DTF to the length of 500 
% which does improve the spectrum of two signals. However, it does not 
% change what lies behind the spectrum as the information about x1[n]
% to resolve the closely spaced frequency components at f = 0.30 and
% f = 0.33 is still insufficient. 