function HammingFunc = HammingFunc(k, n)

    H.e_hat = [0 0 0 0 0 0 0; eye(n)];
    H.p = [1 1 0;1 0 1;0 1 1;1 1 1];
    H.g = [eye(size(H.p ,1)) H.p];
    H.h = [H.p' eye(size(H.p' ,1))];
    H.s = H.e_hat * H.h';
    H.lut = struct('s', H.s, 'e_hat', H.e_hat);
    H.u = de2bi(0:15, k);
    H.c = mod(H.u * H.g, 2);
    
    HammingFunc = H;
    
end