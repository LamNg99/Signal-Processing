% E. Convolution and system stability

% E.1

% System in part B
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0); 
b = [2]; 
a = [1, -3/10, -1/10]; 
h = filter(b,a,impulse(n));   % Unit impulse response

% Input x[n] from part C
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
x = @(n) 2*cos((2/6)*pi*n).*(u(n) - u(n-10));

% Zero-state response from part C
y_zs = filter(b,a,x(n));   

% Zero-state response using convolution
y = @(n) conv(x(n), h);

% Plotting
figure;
subplot(2,1,1);
stem(y(n));
grid;
title("Zero-state Response Using Convolution");
xlabel('n');
ylabel('y_{zs}[n]');

subplot(2,1,2);
stem(y_zs)
title('Zero-state Response form Part C');
grid;
xlabel('n');
ylabel('y_{zs}[n]');

% E.2

% Both methods give the same result for zero-state response.

% E.3

% The system is asymptotically stable since the bended input 
% converges to 0.