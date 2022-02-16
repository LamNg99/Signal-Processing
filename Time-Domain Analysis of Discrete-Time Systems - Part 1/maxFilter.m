% C. Design a filter: N-point maximum filter

% C.1

function y = maxFilter(x,N)
x1 = [zeros(1,N-1) x];          % zero padding
y1 = zeros(1,length(x1));

for count = N:length(x1)
    y1(count) = max(x1(count - (N-1):count));
end
y = y1(N:end);
end