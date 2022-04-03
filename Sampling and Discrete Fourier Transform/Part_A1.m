% A. Discrete Fourier Transform and zero padding

% A.1

n = 0:9; % 10 samples

% Signal x[1] and x[2]
x1 = (exp(j*2*pi*n*(30/100))) + (exp(j*2*pi*n*(33/100)));
x2 = (cos(2*pi*n*(30/100))) + (0.5*cos(2*pi*n*(40/100)));

% Compute Discrete Fourier Transform for both signals
X1 = fft(x1); 
X2 = fft(x2);

N = length(x1); % length(x1) = length(x2) = 10
fr = (0:N-1)/N;

figure;
subplot(2,1,1);
stem(fr-0.5,abs(fftshift(X1)));
grid;
title('DFT of 10-point x_1[n]');
xlabel('f_r');
ylabel('X_1(f_r)');
axis([-0.5 0.5 0 20]);

subplot(2,1,2);
stem(fr-0.5,abs(fftshift(X2)));
grid;
title('DFT of 10-point x_2[n]');
xlabel('f_r');
ylabel('X_2(f_r)');
axis([-0.5 0.5 0 6]);

% A.1.i

% Signal x2[n] has a symmetric spectrum since the time-domain signal x2[n] 
% is real while the time-domain signal x1[n] is complex. 

% A.1.ii

% Since only 10 samples are used, the DTF has only 10 frequency bins 
% uniformly spaced over the frequency interval [-0.5,0.5). Therefore,
% both frequency components of signal x2[n] at f = 0.30 and f = 0.40 are 
% distinguishable. On the other hand, there is insufficient frequency 
% resolution to separately identify the two components closely spaced 
% at f = 0.30 and f = 0.33 for signal x1[n]. 

% A.1.iii

% Other frequency components occur in the plot of DTF of x1[n] because
% the frequency f = 0.33 does not lie directly on a DFT frequency bin 
% which results in the effects of frequency leakage and smearing.


