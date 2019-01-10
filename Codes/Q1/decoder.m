function [u_hat] = decoder(code,b)
    k = code.k;
    lut = code.lut;
    H = code.H;
    s = mod(b * code.H',2)
    s_de = bi2de(s,'left-msb')
    [l,c] = size(lut);
    for i=1:l
       if(s == lut(i,1:k-1))
          erro = lut(i,(length(s))+1:end);
          word_code = xor(erro,b);
          u_hat = word_code(1:k);
          break
       end
    end
end
