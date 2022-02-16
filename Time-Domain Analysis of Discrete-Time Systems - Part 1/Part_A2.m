% A. Signal Transformation

% A.2


n = -10:70; % Range for ploting

%A.2-I
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
y = @(n) 5*exp(-n/8).*(u(n)-u(n-10));
a = y(n);

%A.2-II
y1 = @(n) y(3*n);
b = y1(n);

%A.2-III
y2 = @(n) y(n/3);
c = y2(n);

figure;
subplot(3,1,1);
stem(n,a);
grid;
title('y[n]=5e^{-n/8}(u[n]-u[n-10])');
xlabel('n');
ylabel('y[n]');

subplot(3,1,2);
stem(n,b);
grid;
title('y_1[n]=y[3n]');
xlabel('n');
ylabel('y_1[n]');

subplot(3,1,3);
stem(n,c);
grid;
title('y_2[n]=y[n/3]');
xlabel('n');
ylabel('y_2[n]');