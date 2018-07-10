%% PSK - Trabalhando com constelações
clc; close all; clear all;
%%

% Parâmetros MPSK
Tx_Trans = 500;
bit=10000;upSample=40;
tb=1/Tx_Trans;ts=tb/upSample;
t=[0:ts:(tb*bit)-ts];A=1;
SNR = 1000;

% Informação MPSK
n_2=2; info_2=randint(1,bit,n_2);       % 2PSK
n_4=4; info_4=randint(1,bit,n_4);       % 4PSK
n_8=8; info_8=randint(1,bit,n_8);       % 8PSK
n_16=16; info_16=randint(1,bit,n_16);   % 16PSK

% Mapeando os inteiros em complexo
PSK_2 = pskmod(info_2,n_2);
PSK_4 = pskmod(info_4,n_4);
PSK_8 = pskmod(info_8,n_8);
PSK_16 = pskmod(info_16,n_16);

% Informação modulada
scatterplot(PSK_2,20);title('Informação - 2PSK');
scatterplot(PSK_4,20);title('Informação - 4PSK');
scatterplot(PSK_8,20);title('Informação - 8PSK');
scatterplot(PSK_16,20);title('Informação - 6PSK');

% Recebe a informação
info_r_2 = awgn(PSK_2,20);
info_r_4 = awgn(PSK_4,20);
info_r_8 = awgn(PSK_8,20);
info_r_16 = awgn(PSK_16,20);

% Informação recebida
scatterplot(info_r_2);title('Informação recebida - 2PSK');
scatterplot(info_r_4);title('Informação recebida - 4PSK');
scatterplot(info_r_8);title('Informação recebida - 8PSK');
scatterplot(info_r_16);title('Informação recebida - 16PSK');

%Verifica o erro de simbolo e SNR
for R = 0:SNR
    info_r_2 = awgn(PSK_2,R); 
    info_r_4 = awgn(PSK_4,R); 
    info_r_8 = awgn(PSK_8,R); 
    info_r_16 = awgn(PSK_16,R); 
    
    PSK_Demod_2 = pskdemod(info_r_2,n_2);
    PSK_Demod_4 = pskdemod(info_r_4,n_4);
    PSK_Demod_8 = pskdemod(info_r_8,n_8);
    PSK_Demod_16 = pskdemod(info_r_16,n_16);
    
    [n2(R+1),t2(R+1)]=symerr(info_2,PSK_Demod_2);
    [n4(R+1),t4(R+1)]=symerr(info_4,PSK_Demod_4);
    [n8(R+1),t8(R+1)]=symerr(info_8,PSK_Demod_8);
    [n16(R+1),t16(R+1)]=symerr(info_16,PSK_Demod_16);      
end

semilogy([0:SNR],t2,[0:SNR],t4,[0:SNR],t8,[0:SNR],t16);
legend('2PSK','4PSK','8PSK','16PSK');
ylabel('Relação Sinal Ruido - SNR');xlabel('SNR - dB');

