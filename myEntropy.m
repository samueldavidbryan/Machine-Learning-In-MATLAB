function Y = myEntropy(X)
    m = size(X,1);
    Y = zeros(m,1);
    for i = 1:m
        Y(i) = shannonEntropy(X(i,:));
    end
end