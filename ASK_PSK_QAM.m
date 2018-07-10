%% Utilizando uma sequencia de informação de 10 bits, gere as formas dos sinais modulados para as modulações ASK, PSK e FSK
clear all; cloe all; clc;
%%

Tx_Trans = 500; %bps
k = 4; %Número de bits por simbolo
M = 2; %Número de níveis
fp = 1000;
bits = 10;
upSample = 100;
tb = 1/Tx_Trans;
ts = tb/upSample;
t = [0:ts:(tb*bits)-ts];

% Informação

info = [0 0 1 0 1 0 1 0 1 1];
filtro_tx = ones(1,upSample);
info_up = upsample(info,upSample);
sinal_tx = filter(filtro_tx,1,info_up);

% ASK
A = 1;
phi = 0;
ct = A*cos(2*pi*fp*t+phi);
ask = sinal_tx.*ct;

% PSK
phi = (2*pi*sinal_tx)/M;
psk = A*cos(2*pi*fp*t + phi + (pi/2));

% QAM
qam = sinal_tx.*psk;

figure();subplot(5,1,1);
plot(t,sinal_tx);title('Sinal transmitido');ylim([-0.1 1.2]);
subplot(5,1,2);plot(t,ct);title('Sinal portadora');
subplot(5,1,3);plot(t,ask);title('Modulação ASK');
subplot(5,1,4);plot(t,psk);title('Modulação PSK');
subplot(5,1,5);plot(t,qam);title('Modulação QAM');
