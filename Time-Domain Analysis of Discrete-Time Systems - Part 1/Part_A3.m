% A. Signal Transformation

% A.3.I

u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
y = @(n) 5*exp(-n/8).*(u(n)-u(n-10));
y2 = y(n/3);

u1 = @(n) (n >= 0) * 1.0;
z = @(n) 5*exp(-n/8).*(u1(n)-u1(n-10)); 
y3 = @(n) z(n/3);
n = -10:70;

figure;
subplot(2,1,1);
stem(n,y2);
grid;
title("y2[n]");
xlabel('n');
ylabel('y_2[n]');

subplot(2,1,2);
stem(n,y3(n));
grid;
title("y_3[n]=z[n/3]");
xlabel('n');
ylabel('y_3[n]');

% A.3.II

% y3[n] has more data values than y2[n] because of the fact that the signal 
% transformation was applied to the continuous signal first, allowing 
% the sampling to sample values that now exist in discrete integer values, 
% which previously didn't before stretching the continuous function. 