% A. Discrete-Time Fourier Transform (DTFT)

% A.1

n = 0:127;
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
% Signal x[n]
x = @(n) (1-n/7).*(u(n)-u(n-7));
% Compute DTFT of x[n] using fft command
X = fft(x(n));
% Center the zero frequency component
X = fftshift(X);

Omega = linspace(-pi,pi,128);

% A.2
% Compute DTFT of x[n] by hand calculation
X1 = @(Omega) (1 ...
    +   (6/7).*exp(-1*j*Omega)...
    +   (5/7).*exp(-2*j*Omega)...
    +   (4/7).*exp(-3*j*Omega)...
    +   (3/7).*exp(-4*j*Omega)...
    +   (2/7).*exp(-5*j*Omega)...
    +   (1/7).*exp(-6*j*Omega)); 

figure; 
subplot(2,2,1);
plot(Omega,abs(X));
grid;
title("Magnitude of X(\Omega) Using fft Command");
xlabel('\Omega');
ylabel('|X(\Omega)|');
axis([-pi pi 0 4]);

subplot(2,2,2);
plot(Omega,angle(X));
grid;
title("Phase of X(\Omega) Using fft Command");
xlabel('\Omega');
ylabel('\angleX(\Omega)');
axis([-pi pi -2 2]);

subplot(2,2,3);
plot(Omega,abs(X1(Omega)));
grid;
title("Magnitude of X(\Omega) by Hand Calculation");
xlabel('\Omega');
ylabel('|X(\Omega)|');
axis([-pi pi 0 4]);

subplot(2,2,4);
plot(Omega,angle(X1(Omega)));
grid;
title("Phase of X(\Omega) Using fft by Hand Calculation");
xlabel('\Omega');
ylabel('\angleX(\Omega)');
axis([-pi pi -2 2]);

% The magnitude and phase of DTFT obtained by hand calculation give
% the same result as DTFT computed from fft command from Matlab.

% A.3

% Inverse zero-frequency shift 
X = ifftshift(X); 
% Compute x[n] from inverse DTFT using ifft
x_n = ifft(X);

figure;
subplot(2, 1, 1);
stem(n, x(n));
grid;
title('Original Signal x[n]');
xlabel('n');
ylabel('x[n]');
axis([0 127 0 1]);

subplot(2, 1, 2);
stem(n,x_n);
grid;
title('Signal x[n] from Inverse DTFT of X(\Omega)');
xlabel('n');
ylabel('x[n]');
axis([0 127 0 1]);

% The obtained result is the same as signal x[n] since ifft command
% is used to computed the inverse DTFT of X(Ω).
