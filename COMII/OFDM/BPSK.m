% Utilizando as funções escritas nas Questões 1 e 2, simule o desempenho de erro de bit de
% um sistema OFDM com as especificações abaixo.

N = 16; % Número de subportadoras
u = 4;  % Comprimento do prefixo cíclico
L = 50000; % Número de blocos OFDM transmitidos
h = [2 -0.5 0.5]; % Canal de comunicação

%% BPSK - Trabalhando com constelações
clc; close all; clear all;

% Parâmetros MPSK
Tx_Trans = 500;
bit=10000;upSample=40;
tb=1/Tx_Trans;ts=tb/upSample;
t=[0:ts:(tb*bit)-ts];A=1;
SNR = 1000;

% Informação MPSK
n_2=2; info_2=randint(1,bit,n_2);       % 2PSK

% Mapeando os inteiros em complexo
PSK_2 = pskmod(info_2,n_2);

% Informação modulada
scatterplot(PSK_2,20);title('Informação - 2PSK');

% Recebe a informação
info_r_2 = awgn(PSK_2,20);

% Informação recebida
scatterplot(info_r_2);title('Informação recebida - 2PSK');

%Verifica o erro de simbolo e SNR
for R = 0:SNR
    info_r_2 = awgn(PSK_2,R); 
    PSK_Demod_2 = pskdemod(info_r_2,n_2);
    [n2(R+1),t2(R+1)]=symerr(info_2,PSK_Demod_2);
end

semilogy([0:SNR],t2);
legend('2PSK');
ylabel('Relação Sinal Ruido - SNR');xlabel('SNR - dB');