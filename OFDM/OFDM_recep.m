% Questão 2

function [Y] = OFDM_recep(y,N,u,h)

    % Converte de serial para paralelo
    y_sp = reshape(y,N+u,[]);

    % Retira o PC correspondente ao tamanho u
    y_wpc = y_sp(u+1:N+u,:);
    
    % Transformada de Fourier
    y_f = fft(y_wpc,N);
    
    % EQUALIZAÇÃO
    % Calculo do H[k]
    H = fft(h,N);
    
    % Ajuste de matriz
    h_r = repmat(H.',1,2);
    
    % Equalização
    Y = y_f./h_r;
    
end

