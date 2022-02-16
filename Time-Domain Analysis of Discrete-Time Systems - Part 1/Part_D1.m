% D. Energy and power of a discrete signal

% D.1

function [power,energy] = Part_D1(x)
    power = (1 / length(x)) .* sum(abs(x .^ 2));
    energy = sum(abs(x .^ 2));
end 
