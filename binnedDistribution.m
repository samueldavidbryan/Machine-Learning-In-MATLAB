function Y = binnedDistribution(X)
    [m,n] = size(X);
    nbins = 10;
    Y = zeros(m,nbins);
    for i = 1:m
       Y(i,:) = histcounts(X(i,:),nbins)/n;
    end
end