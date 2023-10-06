function arv = averageResultantAcceleration(X, Y, Z)
    arv = mean(sqrt(X.^2 + Y.^2 + Z.^2),2);
end