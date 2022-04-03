% A. Discrete Fourier Transform and zero padding

% A.3

n = 0:99; % 100 samples

% Signal x[1] and x[2]
x1 = (exp(j*2*pi*n*(30/100))) + (exp(j*2*pi*n*(33/100)));
x2 = (cos(2*pi*n*(30/100))) + (0.5*cos(2*pi*n*(40/100)));

% Compute Discrete Fourier Transform for both signals
X1 = fft(x1); 
X2 = fft(x2);

N = length(x1); % length(x1) = length(x2) = 100
fr = (0:N-1)/N;

figure;
subplot(2,1,1);
stem(fr-0.5,abs(fftshift(X1)));
grid;
title('DFT of 100-point x_1[n]');
xlabel('f_r');
ylabel('X_1(f_r)');
axis([-0.5 0.5 0 120]);

subplot(2,1,2);
stem(fr-0.5,abs(fftshift(X2)));
grid;
title('DFT of 100-point x_2[n]');
xlabel('f_r');
ylabel('X_2(f_r)');
axis([-0.5 0.5 0 60]);

% With 100 samples are used over the frequency interval [-0.5,0.5), 
% each frequency components of both signals x1[n] and x2[n] are easily
% identified. Signal x2[n] has a symmetric spectrum since the time-domain 
% signal x2[n] is real while the time-domain signal x1[n] is complex. 
