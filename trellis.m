%% Mobile communications

trellis = poly2trellis([3], [7 5]);
next_state = trellis.nextStates;
output = trellis.outputs;

codeword = convenc([0 1 1 0 1 0 0 0], trellis); % Encoder % Dois ultimos 0 são o tail
b = codeword; % Aqui é necessário modular e passar pelo canal AWGN.
b(1) = 0;
b(10) = 0;
b(11) = 0;

dif = XOR(codeword,b); %Verify the difference

u_hat = vitdec(b, trellis, 15, 'term', 'hard');

% 15 - tamanho da janela.
% 'term' - terminação nula, ou seja, inicia e termina no estado 0.
% 'hard' - trabalhando com bits