function [u_hat] = decoder(code,b)

    s = mod(b * code.H',2)
    s_de = bi2de(s,'left-msb')
    e_hat = code.e(s_de,:)
    u_hat = e_hat +b
    
end

