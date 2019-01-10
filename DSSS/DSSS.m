%% Questão 1 - Trabalho DSSS

clc;clear all;

Nb = 1000;	% Número de bits transmitidos
L = 200;	% Código: pseudo-aleatório de período
N = 10;     % Número de chips por bit de informação
fc = 40000; % Modulação BPSK 
spc = 100;  % Número de amostras por chip
spb = spc*N;% Taxa de amostras por bit
Rb = 1000;	% Taxa de bits
fa = Rb*spb;% Frequência de amostragem
Tb = 1/Rb;  % Tempo de bit
Ta = 1/fa;  % Tempo de amostragem
D = Nb*Tb;   % Duração
M = 1e6;    % Número de amostras
t = D*(0:(M-1))/M; % Vetor de tempo

Portadora = cos(2*pi*fc*t); % Portadora

% Cria informação e código 
xt = randi([0 1],1,Nb); % Informação aleatória
ct = randi([0 1],1,L); % Código aleatório 

% Polarização
xt_p = xt.*2-1; % Informação
ct_p = ct.*2-1; % Código

% Superamostragem
xt_k = kron(xt_p,ones(1,Nb));
ct_k = kron(ct_p,ones(1,spc));

% Ajusta o vetor de código
ct_conc = repmat(ct_k,1,length(xt_k)/length(ct_k));

% Informação codificada
st = ct_conc.*xt_k;

% Sinal em BPSK
sBPSK = Portadora .* st;

figure(1)
subplot(311);plot(t,xt_k);xlim([0 10*Tb]);ylim([-1.2 1.2]);title('x(t)');
subplot(312);plot(t,ct_conc);xlim([0 10*Tb]);ylim([-1.2 1.2]);title('c(t)');
subplot(313);plot(t,st);xlim([0 10*Tb]);ylim([-1.2 1.2]);title('s(t)');

% Verificamos que o resultado está correto pois onde x(t)=-1 inverte c(t) 
% para o sinal de saída s(t) e onde x(t)=-1 mantem c(t) para o sinal de 
% saída s(t)

figure(2)
subplot(211);plot(t,xt_k);xlim([0 4*Tb]);ylim([-1.2 1.2]);title('x(t)');
subplot(212);plot(t,sBPSK);xlim([0 4*Tb]);ylim([-1.2 1.2]);title('sBPSK');
