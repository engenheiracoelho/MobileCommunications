%% Questão 2 - Trabalho DSSS - DS-CDMA

clc;clear all;close all;

N = 4;  % Número de chips por bit de informação
L = N;	% Código: pseudo-aleatório de período
Nb = 2;	% Número de bits transmitidos
Rb = 200000;% Taxa de bits
Tb = 1/Rb;  % Tempo de bit
spc = 50;   % Número de amostras por chip
spb = spc*N;% Taxa de amostras por bit
fa = Rb*spb;% Frequência de amostragem
Ta = 1/fa;  % Tempo de amostragem
D = Nb*Tb;  % Duração
M = spc*Nb;    % Número de amostras
t = D*(0:(M-1))/M; % Vetor de tempo

% Informação
x1 = [0 0]; % Usuário 1
x2 = [1 0]; % Usuário 2
x3 = [0.5 0.5];   % Usuário 3
x4 = [0 1]; % Usuário 4
c = hadamard(N); % Código de Walsh-Hadamard

% Polarização
x1_p = x1.*2-1; 
x2_p = x2.*2-1; 
x3_p = x3.*2-1; 
x4_p = x4.*2-1; 

% Superamostragem
x1_k = kron(x1_p,ones(1,spb));
x2_k = kron(x2_p,ones(1,spb));
x3_k = kron(x3_p,ones(1,spb));
x4_k = kron(x4_p,ones(1,spb));

figure(1)
subplot(411);plot(x1_k);ylim([-1.2 1.2]);title('x1(t)');
subplot(412);plot(x2_k);ylim([-1.2 1.2]);title('x2(t)');
subplot(413);plot(x3_k);ylim([-1.2 1.2]);title('x3(t)');
subplot(414);plot(x4_k);ylim([-1.2 1.2]);title('x4(t)');

c1_k = kron(c(1,:),ones(1,spc));
c2_k = kron(c(2,:),ones(1,spc));
c3_k = kron(c(3,:),ones(1,spc));
c4_k = kron(c(4,:),ones(1,spc));

% Ajusta o vetor de código
c1t = repmat(c1_k,1,length(x1_k)/length(c1_k));
c2t = repmat(c2_k,1,length(x2_k)/length(c2_k));
c3t = repmat(c3_k,1,length(x3_k)/length(c3_k));
c4t = repmat(c4_k,1,length(x4_k)/length(c4_k));

% Informação codificada
st1 = c1t.*x1_k;
st2 = c2t.*x2_k;
st3 = c3t.*x3_k;
st4 = c4t.*x4_k;

figure(2)
subplot(411);plot(st1);ylim([-1.2 1.2]);title('s1(t)');
subplot(412);plot(st2);ylim([-1.2 1.2]);title('s2(t)');
subplot(413);plot(st3);ylim([-1.2 1.2]);title('s3(t)');
subplot(414);plot(st4);ylim([-1.2 1.2]);title('s4(t)');

% Soma os sinais
rt = st1 + st2 + st3 + st4;

% Multiplica o sinal pelo código
yt1 = rt.*c1t;
yt2 = rt.*c2t;
yt3 = rt.*c3t;
yt4 = rt.*c4t;

figure(3);plot(rt);title('r(t)');ylim([-3.2 1.2]);

figure(4)
subplot(411);plot(yt1);title('y1(t)');
subplot(412);plot(yt2);title('y2(t)');
subplot(413);plot(yt3);title('y3(t)');
subplot(414);plot(yt4);title('y4(t)');

