function [u_hat] = decoderSDD(code,r)
    c = code.c;
    s = (c * 2) -1;
    for ii = 1:size(r, 1)
        rr = repmat(r(ii, 1:end), size(c, 1), 1);
        distE = sum((c - rr).^2, 2);
        [valor_min indice] = min(distE);
        c_hat(ii, 1:code.n) = code.c(indice, :);
    end
    u_hat = c_hat(1:end, 1:code.k);
end