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
u = [1 0 1 0];
word_code = u*code.G;

% Determine uma matriz de verificação de paridade para o código.
code.H = [1 0 0 1 1 0 1; 0 1 0 1 0 1 1; 0 0 1 0 1 1 1]; %Matriz de Hamming

% Erro aproximado
code.e = [0 0 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 1 0 0 1 0 0];

b = [1 0 0 1 1 0 1]

dec = decoder(code,b);

% Construa uma tabela síndrome 7→ padrão de erro.

% Determine uma fórmula exata para a probabiliade de erro de palavra-código usando decodificação hard-decision (HDD), em função de Eb/N0. Assuma sinalização polar.

% Determine um limitante superior para probabiliade de erro de palavra-código usando decodificação soft-decision (SDD), em função de Eb/N0. Assuma sinalização polar.