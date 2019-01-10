%% Codigo de blocos

clc;close all;clear all;

code.n = 7; % Comprimento
code.k = 4; % Dimensão

R = code.k/code.n; % Taxa do código

code.G = [1 0 0 0 1 1 0; 0 1 0 0 1 0 1; 0 0 1 0 0 1 1 ; 0 0 0 1 1 1 1]; % Matriz geradora.

code.word_code = dec2bin([0:2^code.k-1]); % Palavras-código.

code.H = [1 0 0 1 1 0 1; 0 1 0 1 0 1 1; 0 0 1 0 1 1 1]; % Matriz de verificação de paridade.

block_code = mod(code.word_code*code.G,2); % Codigo de bloco
code.c = (block_code*2)-1;

info = randi([0 1], 1,code.n);% Informacao
r = awgn(info, 60);
r_polar = r*2-1;

dec = decoder(code,r);
