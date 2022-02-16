% C. Design a filter: N-point maximum filter

% C.2

% Length of input
n = 0:45;   

% Impulse function
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0);

% Input signal
x = @(n) (cos(pi*n/5)+impulse(n-20)-impulse(n-35));           

% Outputs
y1 = maxFilter(x(n),4);                                       
y2 = maxFilter(x(n),8);
y3 = maxFilter(x(n),12);

% Plotting 

figure;
subplot(4,1,1);
stem(n,x(n));
grid;
title('Input signal x[n]');
xlabel('n');
ylabel('x[n]');

subplot(4,1,2);
stem(n,y1);
grid;
title('Max filtering with N=4');
xlabel('n');
ylabel('y_1[n]');

subplot(4,1,3);
stem(n,y2);
grid;
xlabel('n');
title('Max filtering with N=8');
ylabel('y_2[n]')

subplot(4,1,4);
stem(n,y3);
grid;
title('Max filtering with N=12');
xlabel('n');
ylabel('y_3[n]');

% C.3

% As N approaches infinity, the output signal approaches a unit 
% step function multiplied by the max value of the input signal x[n].

