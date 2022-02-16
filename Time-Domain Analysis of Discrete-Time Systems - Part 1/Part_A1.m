% A. Signal Transformation

% A.1

n = -10:10; % Range for plotting

% A.1.I
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
a = impulse(n-3);

% A.1.II
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);   
b = u(n+1);

% A.1.III
x = @(n) u(n) .* cos((n .* pi) / 5);
c = x(n);

% A.1.IV
x1 = @(n) x(n-3);
d = x1(n);

% A.1.V
x2 = @(n) x(-n);
e = x2(n);

% Plotting

figure;
subplot(2,1,1);
stem(n,a);
grid;
title('\delta[n-3]');
xlabel('n');
ylabel('\delta[n-3]');

subplot(2,1,2);
stem(n,b);
grid;
title('u[n+1]');
xlabel('n');
ylabel('u[n+1]');

figure;
subplot(3,1,1);
stem(n,c);
grid;
title('x[n]=cos(\pin/5)u(n)');
xlabel('n');
ylabel('x[n]');

subplot(3,1,2);
stem(n,d);
grid;
title('x_1[n]=x[n-3]');
xlabel('n');
ylabel('x_1[n]');

subplot(3,1,3);
stem(n,e);
grid;
title('x_2[n]=x[-n]');
xlabel('n');
ylabel('x_2[n]');

% x1[n] is being time shifted to the right by 3. 
% x2[n] is being time reversed.


