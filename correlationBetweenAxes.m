function [corr_xy,corr_xz,corr_yz] = correlationBetweenAxes(X,Y,Z)
    m = size(X,1);
    corr_xy = zeros(m,1);
    corr_xz = zeros(m,1);
    corr_yz = zeros(m,1);
    for i = 1:m
        x = X(i,:);
        y = Y(i,:);
        z = Z(i,:);
        corr_xy(i) = pair_correlate(x,y);
        corr_xz(i) = pair_correlate(x,z);
        corr_yz(i) = pair_correlate(y,z);
    end
end

function rxy = pair_correlate(x,y)
    % https://en.wikipedia.org/wiki/Correlation
    n = length(x);
    rxy = sum((x - mean(x)).*(y - mean(y)))/(n-1)/std(x)/std(y);
end