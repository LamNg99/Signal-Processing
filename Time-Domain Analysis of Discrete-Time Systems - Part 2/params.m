% F.2

function [a,b] = params(N)
% This function will return the generated parameters a and b which
% correspond to the coefficients of the y[n] and x[n] respectively.

a = 1;
b = ones(N,1)/N;
