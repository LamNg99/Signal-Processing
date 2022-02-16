% B. Recursive solution of difference equation

% B.1

% The equation relating the output y[n] (the balance) to the input x[n]
% (the deposit) is
% y[n] = y[n - 1] + 0.02 * y[n - 1] + x[n]

% B.2

y = zeros(1, 12);
y(1) = 1.02 * 2000;

for i = 2:12
    y(i) = y(i - 1) + 0.02 * y(i - 1);
end

figure;
stem(y);
grid;
title('Account balance for every month');
xlabel('Month');
ylabel('Balance');

% B.3

y = zeros(1, 12);
y(1) = 1.02 * 2000 + 100 * 1;

for i = 2:12
    y(i) = y(i - 1) + 0.02 * y(i - 1) + 100 * i;
end

figure;
stem(y);
grid;
title('Account balance for every month');
xlabel('Month');
ylabel('Balance');

