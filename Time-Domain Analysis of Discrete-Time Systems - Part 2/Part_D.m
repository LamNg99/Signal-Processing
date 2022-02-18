% D. Total response

n = 0:20; % Range for plotting

% Input x[n] from part C
u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
x = @(n) 2*cos((2/6)*pi*n).*(u(n) - u(n-10));

% Zero input response from part B and zero-state response from part C
b = [2]; 
a = [1, -3/10, -1/10]; 
y = [1, 2]; 
x_ic = filtic(b, a, y); 
m = zeros(1, length(n)); 
y_zi = filter(b, a, m, x_ic) ; 
y_zs = filter(b,a,x(n));   

% Total response using filter command
y_total = filter(b,a,x(n),x_ic);

% Total response by adding zero input response and zero-state response
y_add = y_zi + y_zs; 

% Plotting
figure;
subplot(2,1,1);
stem(n,y_total);
grid;
title("Total Response Using Filter Command");
xlabel('n');
ylabel('y_{total}[n]');

subplot(2,1,2);
stem(n,y_add);
grid;
title("Total Response by Adding Zero Input Response and Zero-state Response");
xlabel('n');
ylabel('y_{total}[n]');

% Both methods give the same result for total response.



