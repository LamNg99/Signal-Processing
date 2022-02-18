% F. Moving average filter

% F.3

n = 0:45;

impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);
x = @(n) cos(pi*n/5)+impulse(n-30)-impulse(n-35);

[a1,b1] = params(4);
[a2,b2] = params(8);
[a3,b3] = params(12);

figure;
subplot(4,1,1);
stem(n,x(n));
grid;
title("Input x[n]");
xlabel('n');
ylabel('x[n]');

subplot(4,1,2);
stem(n,filter(b1,a1,x(n)));
grid;
title("Filter with N = 4");
xlabel('n');
ylabel('y_1[n]');

subplot(4,1,3);
stem(n,filter(b2,a2,x(n)));
grid;
title("Filter with N = 8");
xlabel('n');
ylabel('y_2[n]');

subplot(4,1,4);
stem(n,filter(b3,a3,x(n)));
grid;
title("Filter with N = 12");
xlabel('n');
ylabel('y_3[n]');

% The moving average filter is a simple Low Pass FIR filter. Therefore,
% a sinusoidal input reaches steady-state after N-1 sample. In addition, 
% larger value of N results in filtered signal approaching to 0 
% and the effect of the impulse on the size of the output signal decreasing.