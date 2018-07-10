%% Utilizando uma sequencia de informação de 10 bits, gere as formas dos sinais modulados para as modulações ASK, PSK e FSK

clear all; close all; clc;

Tx_Trans = 500; %bps
niveis = 2;

bit = 10;
fp = 1000;
upSample = 40;
tb = 1/Tx_Trans;
ts = tb/upSample;
t = [0:ts:(tb*bit)-ts];

%% Gerar a informação

info = [0 0 1 0 1 0 1 0 1 1]; 
filtro_tx = ones(1,upSample);
info_up = upsample(info,upSample);
sinal_tx = filter(filtro_tx,1,info_up);

%% ASK
A = 1;
phi = 0;

ct = A*cos(2*pi*fp*t+phi);
ask = sinal_tx.*ct;

subplot(511);plot(t,sinal_tx);title('Sinal transmitido');ylim([-0.1 1.2]);
subplot(512);plot(t,ct);title('Sinal com portadora');
subplot(513);plot(t,ask);title('Modulação ASK');

%% PSK

phi = (2*pi*sinal_tx)/niveis;
s_t_PSK = A*cos(2*pi*fp*t + phi);
s_t_PSK = A*cos(2*pi*fp*t + phi + (pi/2));

subplot(514);plot(t,s_t_PSK);title('Modulação PSK');

%% FSK

s_t_FSK = A * cos(2*pi*fp*t.*(sinal_tx+1));
subplot(515);plot(t,s_t_FSK);title('Modulação FSK');

