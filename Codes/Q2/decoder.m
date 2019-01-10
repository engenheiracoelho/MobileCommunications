function [u_hat] = decoder(code,r)
    c = code.c;
    s = (c * 2) -1;
    d = r * c';
    [m, value] = max(d);
    c_hat = (c(value,:)+1)/2;
    u_hat = c_hat(1:code.k);
end
