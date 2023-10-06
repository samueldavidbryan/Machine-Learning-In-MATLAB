function Y = averageAbsoluteDifference(X)
    Y = mean(abs(X - mean(X,2)),2);
end