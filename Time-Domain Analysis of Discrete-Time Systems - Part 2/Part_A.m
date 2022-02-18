% A. Unit Impulse Response

% A.1

n = -10:10; % Range for plotting
impulse = @(n) (n == 0) * 1.0 .* (mod(n, 1) == 0); % impulse function
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0); % unit step function

% Determine h[n] using filter command
% A.1.I
b1 = [1/3 0 0]; % Numerator coefficients
a1 = [1 1/6 -1/6]; % Denominator coefficients
h1_filter = filter(b1,a1,impulse(n));

% A.1.II
b2 = [1 0 0]; % Numerator coefficients
a2 = [1 0 1/4]; % Denominator coefficients
h2_filter = filter(b2,a2,impulse(n));

% A.2.I
h1_calculated = @(n) ((2/15).*(1/3).^n + 0.2.*(-0.5).^n).*u(n);

% A.2.II
h2_calculated = @(n) 0.5*(((-j/2).^n)+((j/2).^n)).*u(n);

% Plotting

figure;
subplot(2,1,1);
stem(n,h1_filter);
grid;
title("Unit Impulse Response Using Filter Command");
xlabel('n');
ylabel('h_1[n]');

subplot(2,1,2);
stem(n,h1_calculated(n));
grid;
title("Unit Impulse Response from Manual Calculation");
xlabel('n');
ylabel('h_1[n]');

figure;
subplot(2,1,1);
stem(n,h2_filter);
grid;
title("Unit Impulse Response Using Filter Command");
xlabel('n');
ylabel('h_2[n]');

subplot(2,1,2);
stem(n,h2_calculated(n));
grid;
title("Unit Impulse Response from Manual Calculation");
xlabel('n');
ylabel('h_2[n]');

% h[n]s calculated by hand give same results as using 
% filter command from Matlab.

% A.3

% Filtered data using filter command from Matlab, returned as a vector, 
% matrix, or multidimensional array of the same size as the input data.
% Therefore, to extract the value of n = 3 in h1_filter and h2_filter,
% in the range [-10:10], the index of its is 14.

% From the plots or from Matlab command, the value of h[3] is the same in
% both methods.

