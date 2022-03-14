% C. System Response

% C.2
N_0 = 32; %fundamental period
omega_0 = 2*pi/N_0;% fundamental frequency

n = 0:N_0-1; 

% Rewrite H[r] in the interval of [0,N_0-1]
H = [ones(1,5) zeros(1,23) ones(1,4)];
x1 = @(n) 4.0*cos(pi*n/8); % Input Signal x1[n]

for r = 0:N_0-1
    X1(r+1) = (1/N_0).*sum(x1(n).*exp(-j.*r.*(omega_0).*n));
end

r = n; 

Y1 = H.*X1; % Calculate DTFS of y2[n]

for n = 0:N_0-1
    y1(n+1) = sum(Y1.*exp(-j*r*(omega_0)*n));
end

n = r;

figure;
subplot(3,1,1);
stem(n,x1(n));
title('Input Signal x_1[n]');
axis([0 32 -5 5]);
xlabel('n');
ylabel('x_1[n]');

subplot(3,1,2);
stem(r,Y1);
title('DTFS of y_1[n]');
axis([0 32 0 2.5]);
xlabel('n');
ylabel('Y_1[r]');

subplot(3,1,3);
stem(n,y1);
title('Output Signal y_1[n]');
axis([0 32 -5 5]);
xlabel('n');
ylabel('y_1[n]');


