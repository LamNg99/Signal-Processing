% B. Zero Input Response

n = 0:20; % Range for plotting
b = [2]; % Numerator coefficients
a = [1, -3/10, -1/10]; % Denominator coefficients
y = [1, 2]; % Initial conditions for output
x_ic = filtic(b, a, y); % Finding initial conditions
m = zeros(1, length(n)); % The input is assigned as zeros
y_zi = filter(b, a, m, x_ic) ; % Zero input response

% Plotting
stem(n, y_zi); 
grid;
title('Zero Input Response');
xlabel('n');
ylabel('y_0[n]');
