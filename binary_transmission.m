clc; clear all; close all;
% k = 3, 5 e 8 com SNR = 100;
% SNR = 0, 5, 10 com k = 8;

k=8;
SNR =100;
Nsamp = 10;

[d,Fs] = audioread('owl.wav');% Aquisição do audio
infoA = audioinfo('owl.wav');
t = 0:seconds(1/Fs):seconds(infoA.Duration);
t = t(1:end-1);
sound(d,Fs);% Ouvir o som original

figure(1);subplot(411);plot(t,d);grid on;legend('Sinal de som de coruja - original');title('Transmissão com k=8 e SNR=100');

d = d+1;% insere offset (deslocamento)
subplot(412);plot(t,d);legend('Sinal de som de coruja - deslocado');

%% Quantização
L=2^k;
delta=2/L;
voz_q = d/delta; % quantiza em 4 niveis de quantizacao
voz_int = round(voz_q); % Valores em decimal
voz_bin = de2bi(voz_int); % Valores com níveis (binário)

%% Filtro para transmissão:
% codificacao do sinal
voz_dig = reshape(voz_bin, 1, size(voz_bin,1)*size(voz_bin,2));  %Verifica o tamanho do reshape 40000*3=lin*col
filtro_nrz = ones(1, Nsamp);
info_up = (upsample(voz_bin, Nsamp));
infoF = filter(filtro_nrz, 1, info_up);
sinal_tx = infoF.*2 - 1;

%% Canal AWGN para transmissão
sinal_rx = awgn(sinal_tx, SNR);

%% Filtro casado
filterC = flip(filtro_nrz);
sinal_rx = filter(filterC, 1, sinal_rx)/Nsamp;

%% Conversão
Sinal_T = sinal_rx(Nsamp:Nsamp:end);
infoB = (Sinal_T > 0);
subplot(413);plot(infoB);legend('Sinal recebido - niveis');ylim([-0.8 1.2]);

%% Recebendo sinal codificado
voz_dig_rx = reshape(infoB, (size(infoF, 1)/10), size(infoF, 2));
voz_int = bi2de(voz_dig_rx);

voz_int = voz_int * delta; % volta ao formato original
voz_int = voz_int - 1;    % remove o offset

subplot(414);plot(t,voz_int);legend('Sinal após a transmissão');grid off;  % Verifica a forma de onda do sinal recebido
sound(voz_int, 8000);  % Verifica se o som é semelhante
