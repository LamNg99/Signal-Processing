% C. System Response

% C.3
N_0 = 32; %fundamental period
omega_0 = 2*pi/N_0; % fundamental frequency

n = 0:N_0-1; 

% Rewrite H[r] in the interval of [0,N_0-1]
H = [ones(1,5) zeros(1,23) ones(1,4)];
x2 = @(n) 4.0*cos(pi*n/2); % Input signal

for r = 0:N_0-1
    X2(r+1) = (1/N_0).*sum(x2(n).*exp(-j.*r.*(omega_0).*n));
end

r = n; 

Y2 = H.*X2; % Calculate DTFS of y2[n]

for n = 0:N_0-1
    y2(n+1) = sum(Y2.*exp(-j*r*(omega_0)*n));
end

n = r;

figure;
subplot(3,1,1);
stem(n,x2(n));
title('Input Signal x_2[n]');
axis([0 32 -5 5]);
xlabel('n');
ylabel('x_2[n]');

subplot(3,1,2);
stem(r,Y2);
title('DTFS of y_2[n]');
axis([0 32 0 2.5]);
xlabel('n');
ylabel('Y_2[r]');

subplot(3,1,3);
stem(n,y2);
title('Output Signal y_2[n]');
axis([0 32 -5 5]);
xlabel('n');
ylabel('y_2[n]');

% C.4

% x1[n] passes through the filter unaltered and x2[n] is completely 
% rejected by the filter. The reason is frequecies presented in x1[n] 
% lie inside the passband of the filter (where filter allows to pass) 
% while frequecies presented in x2[n] lie inside the reject-band of 
% the filter (where filter does not allows to pass).