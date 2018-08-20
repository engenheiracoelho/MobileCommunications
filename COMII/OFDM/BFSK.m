%% BPSK

N = 16;                 % Número de subportadoras
u = 4;                  % Comprimento do prefixo cíclico
L = 50000;              % Número de blocos OFDM transmitidos
h = [2 -0.5 0.5];       % Canal de comunicação
Tx_Trans = 500;         % Taxa de transmissão
bit=10000;              % Nº bits 
upSample=40;            % Taxa de simbolos
tb=1/Tx_Trans;          % Tempo de bits
ts=tb/upSample;         % Tempo de simbolos
t=[0:ts:(tb*bit)-ts];   % Vetor de tempo
A=1;                    % Amplitude
SNR = 1000;             % Relação sinal ruído

info = randint(1,bit,2);                                 % Informação
PSK = pskmod(info,2);                                    % Mapeando os inteiros em complexo
scatterplot(PSK,20);title('Informação - 2PSK');          % Informação modulada
info_r = awgn(PSK,20);                                   % Recebe a informação
scatterplot(info_r);title('Informação recebida - 2PSK'); % Informação recebida

for R = 0:SNR                                            %Verifica o erro de simbolo e SNR
    info_r = awgn(PSK,R); 
    PSK_demod = pskdemod(info_r,2);
    [n2(R+1),t2(R+1)]=symerr(info,PSK_demod);
end

semilogy([0:SNR],t2);title('Relação sinal ruído');ylabel('Relação Sinal Ruido - SNR');xlabel('SNR - dB');