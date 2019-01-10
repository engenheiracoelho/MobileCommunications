%% Codigo de blocos
clc;close all;clear all;

% Determine o comprimento e a dimensão do código.
code.n = 7; % Comprimento
code.k = 4; % Dimensão

% Determine a taxa do código.
R = code.k/code.n;

% Determine uma matriz geradora para o código.
code.G = [1 0 0 0 1 1 0; 0 1 0 0 1 0 1; 0 0 1 0 0 1 1 ; 0 0 0 1 1 1 1];

% Determine todas as palavras-código.
code.word_code = dec2bin([0:2^code.k-1]);

% Determine uma matriz de verificação de paridade para o código.
code.H = [1 0 0 1 1 0 1; 0 1 0 1 0 1 1; 0 0 1 0 1 1 1]; %Matriz de Hamming

% Determine o codigo de bloco
block_code = mod(code.word_code*code.G,2);
code.c = (block_code*2)-1;

% Determine a informacao
info = randi([0 1], 1,code.n);
r = awgn(info, 60);
r_polar = r*2-1;

dec = decoder(code,r);
