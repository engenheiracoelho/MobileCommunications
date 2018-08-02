function [Xm] = OFDM_trans(x,N,u)

  % Transformando o vetor em matriz
  x_m = reshape(x,N,u)
  
  % Transformada inversa de Fourier
  x_fft = ifft(Y)
  
  %Prefixo Cíclico (PC)
    
  % Transpõe as colunas para linhas, assim possibilita pegar o 'pedaço' do PC
  x_trans = x_fft.'
  % Recupera parte do PC correspondente ao tamanho u
  
  % Reune Parte do PC com a informação total
  
end
