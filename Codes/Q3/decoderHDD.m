function [u_hat] = decoderHDD(code,b)
    
    H_t = code.H.';

    for ii = 1:size(b, 1)
        s = b(ii, 1:end) * H_t;
        S = mod(s, 2);

        LUT = code.lut;
        pos = find(ismember(LUT.s, S, 'rows'));
        e_hat = LUT.e_hat(pos, :);

        c_hat(ii, 1:code.n) = xor(e_hat, b(ii, 1:end));
    end

    u_hat = c_hat(1:end, 1:code.k);

end