function Y = timeBetweenPeaks(X)
    m = size(X,1);
    Y = zeros(m,1);
    for i = 1:m
        [~,~,peak_indices] = findpeaks(X(i,:));
        Y(i) = mean(diff(peak_indices));
    end
end