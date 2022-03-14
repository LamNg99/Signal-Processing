% A. Discrete-Time Fourier Series

% A.3

N_0 = 6; %fundamental period
omega_0 = 2*pi/6; % fundamental frequency

n = 0:N_0-1;

% Signal y[n] can be represented as following:
y_n = [3 2 1 0 1 2];

for r = 0:N_0-1
    D_r(r+1) = (1/N_0).*sum(y_n.*exp(-j*r*omega_0*n));
end

r = n;

figure;
subplot(3,1,1);
stem(n,y_n);
grid;
title("Signal y[n]");
xlabel('n');
ylabel('y[n]');

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