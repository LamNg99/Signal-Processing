% B. Inverse DTFS and Time Shifting Property

% B.1
N_0 = 32; %fundamental period
omega_0 = 2*pi/32; % fundamental frequency

r = 0:N_0-1;

% Rewrite Xr in the interval of [0,N_0-1]
X_r = [ones(1,5) zeros(1,23) ones(1,4)]; 

for n = 0:N_0-1
    x_n(n+1) = sum(X_r.*exp(-j*r*omega_0*n));
end

n = r;

figure;
stem(n,x_n);
grid;
title("Signal x[n]");
xlabel('n');
ylabel('x[n]');
