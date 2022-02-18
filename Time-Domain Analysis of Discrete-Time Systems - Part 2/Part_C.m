% C. Zero-state Response

n = 0:20; % Range for plotting
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0); % Unit step function
x = @(n) 2*cos((2/6)*pi*n).*(u(n) - u(n-10)); % Input function

b = [2]; % Numerator coefficients
a = [1, -3/10, -1/10]; % Denominator coefficients

y_zs = filter(b,a,x(n)); % Zero-state response
stem(n,y_zs)
title('Zero-state Response');
grid;
xlabel('n');
ylabel('y_{zs}[n]');
