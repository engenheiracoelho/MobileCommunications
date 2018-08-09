% Question 1

function [Xm] = OFDM_trans(x,N,u)

  % Transformando o vetor em matriz
  x_m = reshape(x,N,u)
  
  % Transformada inversa de Fourier
  x_fft = ifft(x_m)
  
  %Prefixo Cíclico (PC)
  
  % Recupera parte do PC correspondente ao tamanho u
  x_popc = x_fft(N-u+1:N,:)
  
  % Concatena parte do PC com a informação total
  Xm = [x_popc;x_fft]
  
end
