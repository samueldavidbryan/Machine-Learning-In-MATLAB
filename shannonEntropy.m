function h = shannonEntropy(x)
    % https://stackoverflow.com/questions/48343989/whats-the-correct-way-of-calculate-the-entropy-of-a-variable
    x_uni = unique(x);
    x_uni_size = numel(x_uni);

    P = zeros(x_uni_size,1);
    for i = 1:x_uni_size
        P(i) = sum(x == x_uni(i));
    end
    P = P ./ numel(x);
    % Compute Shannon's Entropy
    h = -sum(P .* log2(P));
end