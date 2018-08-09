% Questão 1

function [x] = OFDM_trans(X,N,u)

  % Transformando o vetor em matriz
  X_m = reshape(X,N,u);
  
  % Transformada inversa de Fourier
  X_fft = ifft(X_m);
  
  %Prefixo Cíclico (PC)
  
  % Recupera parte do PC correspondente ao tamanho u
  X_popc = X_fft(N-u+1:N,:);
  
  % Concatena parte do PC com a informação total
  X_conc = [X_popc;X_fft];
  
  % Realiza a conversão de paralelo para serial e efetua a transmissão
  x = reshape(X_conc,1,[]);

end
