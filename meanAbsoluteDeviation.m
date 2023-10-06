function Y = meanAbsoluteDeviation(X)
    n = size(X,2);
    Y = sqrt(sum(abs(X-mean(X,2)),2)/(n-1));
end