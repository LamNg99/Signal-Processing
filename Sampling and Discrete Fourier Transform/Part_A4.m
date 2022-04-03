% A. Discrete Fourier Transform and zero padding

% A.3

n = 0:99; % 100 samples

% Signal x[1] and x[2]
x1 = (exp(j*2*pi*n*(30/100))) + (exp(j*2*pi*n*(33/100)));
x2 = (cos(2*pi*n*(30/100))) + (0.5*cos(2*pi*n*(40/100)));

% Zero-pad the signals x1[n] and x2[n] with 490 zeros
x1 = [x1,zeros(1,400)];
x2 = [x2,zeros(1,400)];

% Compute Discrete Fourier Transform for both signals
X1 = fft(x1); 
X2 = fft(x2);

N = length(x1); % length(x1) = length(x2) = 500
fr = (0:N-1)/N;

figure;
subplot(2,1,1);
stem(fr-0.5,abs(fftshift(X1)));
grid;
title('DFT of 100-point x_1[n] zero-padded to 500 points');
xlabel('f_r');
ylabel('X_1(f_r)');
axis([-0.5 0.5 0 120]);

subplot(2,1,2);
stem(fr-0.5,abs(fftshift(X2)));
grid;
title('DFT of 100-point x_2[n] zero-padded to 500 points');
xlabel('f_r');
ylabel('X_2(f_r)');
axis([-0.5 0.5 0 60]);

% Using 100 samples and zero padding to 500 points, the spectrum 
% is significantly improved as each frequency component of both signal 
% can be separately identified and it indicates a clearer picture of
% the data compared to the plots with 10 samples.