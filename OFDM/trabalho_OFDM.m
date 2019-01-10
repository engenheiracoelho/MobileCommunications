close all;clear all;clc;

X = [1 1 -1 -1 -1 1 -1 1];
N = 4;
u = 2;
snr = 15;

% H[k] é o ganho do k-ésimo subcanal
h1 = 1;
h2 = [1 0.25];
h3 = [1 0.25 0.50];
h4 = [1 0.25 0.50 0.25];

% Transmissão OFDM
x = OFDM_trans(X,N,u);

% CANAL - Informação com prefixo cíclico passado pelo canal
y1 = filter(h1,1,x);
y2 = filter(h2,1,x);
y3 = filter(h3,1,x);
y4 = filter(h4,1,x);

% Recepção OFDM
Y1 = OFDM_recep(y1,N,u,h1);
Y2 = OFDM_recep(y2,N,u,h2);
Y3 = OFDM_recep(y3,N,u,h3);
Y4 = OFDM_recep(y4,N,u,h4);
