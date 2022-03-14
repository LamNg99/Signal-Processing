% A. Discrete-Time Fourier Series

% A.2

N_0 = 5; %fundamental period
omega_0 = 2*pi/5; % fundamental frequency

n = 0:N_0-1;

% Signal x[n] can be rewritten as following:
x = @(n) (4.*cos(0.4*pi*n) + 2.*sin(1.2*pi*n));

for r = 0:N_0-1
    D_r(r+1) = (1/N_0).*sum(x(n).*exp(-j*r*omega_0*n));
end

r = n;

figure;
subplot(3,1,1);
stem(n,x(n));
grid;
title("Signal x[n]");
xlabel('n');
ylabel('x[n]');

subplot(3,1,2);
stem(r,abs(D_r));
grid;
title("Magnitude of D_r");
xlabel('r');
ylabel('|D_r|');

subplot(3,1,3);
stem(r,angle(D_r));
grid;
title("Phase of D_r");
xlabel('r');
ylabel('\angleD_r');