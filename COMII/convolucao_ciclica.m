x = [-1 1]
h = [1 3]

% Convolução dos sinais - domínio do tempo
y = conv(h,x)

% FFT - resultado no domínio da frequềncia
H = fft(h)
Y = fft(y)

%Demonstra que a convolução não funciona no domínio discreto
Y2 = H.*X