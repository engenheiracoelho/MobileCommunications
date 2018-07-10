%% QAM - Trabalhando com constelações
clc; close all; clear alclosl;
%%

% Parâmetros MQAM
bit=10000;SNR = 1000;

% Informação MQAM
n_2=2; info_2=randint(1,bit,n_2);       % 2QAM
n_4=4; info_4=randint(1,bit,n_4);       % 4QAM
n_8=8; info_8=randint(1,bit,n_8);       % 8QAM
n_16=16; info_16=randint(1,bit,n_16);   % 16QAM

% Mapeando os inteiros em complexo
QAM_2 = qammod(info_2,n_2);
QAM_4 = qammod(info_4,n_4);
QAM_8 = qammod(info_8,n_8);
QAM_16 = qammod(info_16,n_16);

% Informação modulada
scatterplot(QAM_2,20);title('Informação - 2QAM');
scatterplot(QAM_4,20);title('Informação - 4QAM');
scatterplot(QAM_8,20);title('Informação - 8QAM');
scatterplot(QAM_16,20);title('Informação - 6QAM');

% Recebe a informação
info_r_2 = awgn(QAM_2,20);
info_r_4 = awgn(QAM_4,20);
info_r_8 = awgn(QAM_8,20);
info_r_16 = awgn(QAM_16,20);

% Informação recebida
scatterplot(info_r_2);title('Informação recebida - 2QAM');
scatterplot(info_r_4);title('Informação recebida - 4QAM');
scatterplot(info_r_8);title('Informação recebida - 8QAM');
scatterplot(info_r_16);title('Informação recebida - 16QAM');

%Verifica o erro de simbolo e SNR
for R = 0:SNR
    info_r_2 = awgn(QAM_2,R); 
    info_r_4 = awgn(QAM_4,R); 
    info_r_8 = awgn(QAM_8,R); 
    info_r_16 = awgn(QAM_16,R); 
    
    QAM_Demod_2 = qamdemod(info_r_2,n_2);
    QAM_Demod_4 = qamdemod(info_r_4,n_4);
    QAM_Demod_8 = qamdemod(info_r_8,n_8);
    QAM_Demod_16 = qamdemod(info_r_16,n_16);
    
    [n2(R+1),t2(R+1)]=symerr(info_2,QAM_Demod_2);
    [n4(R+1),t4(R+1)]=symerr(info_4,QAM_Demod_4);
    [n8(R+1),t8(R+1)]=symerr(info_8,QAM_Demod_8);
    [n16(R+1),t16(R+1)]=symerr(info_16,QAM_Demod_16);      
end

semilogy([0:SNR],t2,[0:SNR],t4,[0:SNR],t8,[0:SNR],t16);
legend('2QAM','4QAM','8QAM','16QAM');
ylabel('Relação Sinal Ruido - SNR');xlabel('SNR - dB');

