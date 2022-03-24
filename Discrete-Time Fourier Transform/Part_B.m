% B. Time Convolution

% B.1

n = 0:1000;

u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
% Signal x[n]
x = @(n) sin(2*pi*n/10).*(u(n)-u(n-10));

% Compute DTFT of signal x[n]
omega = linspace(-pi, pi, 1001);
W_omega_x = exp(-j).^((0:length(x(n))-1)'*omega);
X = (x(n)*W_omega_x);

figure;
plot(omega,abs(X));
grid;
title('DTFT of Signal x[n]');
xlabel('\Omega');
ylabel('X(\Omega)');
axis([-pi pi 0 6]);

% B.2

% Signal h[n]
h = @(n) u(n)-u(n-9);
% Compute DTFT of signal h[n]
W_omega_h = exp(-j).^((0:length(h(n))-1)'*omega);
H = (h(n)*W_omega_h);

figure;
plot(omega,abs(H));
grid;
title('DTFT of Signal h[n]');
xlabel('\Omega');
ylabel('H(\Omega)');
axis([-pi pi 0 10]);

% B.3
Y1 = X.*H;

figure;
plot(omega,abs(Y1));
grid;
title('DTFT of Signal y[n] with Y(\Omega)=X(\Omega)H(\Omega)');
xlabel('\Omega');
ylabel('Y(\Omega)');
axis([-pi pi 0 30]);

% B.4

% Compute y[n] by convolving x[n] and h[n]
y = @(n) conv(x(n),h(n));

% B.5
% Compute DTFT of signal y[n]
W_omega_y = exp(-j).^((0:length(y(n))-1)'*omega);
Y2 = (y(n)*W_omega_y);

figure;
plot(omega,abs(Y2));
grid;
title('DTFT of Signal y[n] by Convolving x[n] and h[n]');
xlabel('\Omega');
ylabel('Y(\Omega)');
axis([-pi pi 0 30]);

% B.6

% The results in part 3 and 5 are the same as it shows the time 
% convolution property of the DTFT. Specifically, the convolution 
% of signals in the time domain will be transformed into the 
% multiplication of their Fourier transforms in the frequency domain.