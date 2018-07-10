%% PSK - Trabalhando com constelações
clc; close all; clear all;
%%

% Parâmetros 16PSK e 16QAM
bit=10000;SNR = 1000;

% Informação MPSK
n_16=16; 
info_16=randint(1,bit,n_16);

% Mapeando os inteiros em complexo
PSK_16 = pskmod(info_16,n_16);
QAM_16 = qammod(info_16,n_16);

% Informação modulada
scatterplot(PSK_16,20);title('Informação - 16PSK');
scatterplot(QAM_16,20);title('Informação - 16QAM');

% Recebe a informação
info_psk = awgn(PSK_16,20);
info_qam = awgn(QAM_16,20);

% Informação recebida
scatterplot(info_psk);title('Informação recebida - 16PSK');
scatterplot(info_qam);title('Informação recebida - 16QAM');

%Verifica o erro de simbolo e SNR
for R = 0:SNR
    info_psk = awgn(PSK_16,R); 
    info_qam = awgn(QAM_16,R); 
    
    PSK_Demod_16 = pskdemod(info_psk,n_16);
    QAM_Demod_16 = qamdemod(info_qam,n_16);
    
    [npsk(R+1),tpsk(R+1)]=symerr(info_16,PSK_Demod_16); 
    [nqam(R+1),tqam(R+1)]=symerr(info_16,QAM_Demod_16);
end

semilogy([0:SNR],tpsk,[0:SNR],tqam);
legend('16PSK','16QAM');
ylabel('Relação Sinal Ruido - SNR');xlabel('SNR - dB');

