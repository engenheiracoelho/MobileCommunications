%% Código de Golay
clear all; close all; clc;

Nwc = 1000; % número de palavras-código
SNR_l = -1:7; % em dB

codeG = GolayFunc(12,23); % k = 12; n = 23;

k = 12; n = 23;
codeG.k = k; codeG.n = n;
u = randi([0 1], 1, Nwc*k);

c_gol = mod(reshape(u, Nwc, k)*codeG.G, 2); % Info codificada
cr_gol = reshape(c_gol, 1, Nwc*n);

s = pammod(cr_gol, 2); % Sinal modulado

Eb = (s * s') / (k * Nwc);
for SNR = SNR_l
    snr_linear = 10^(SNR/10);
    No = Eb/snr_linear;
    w = randn(1, n*Nwc) * sqrt(No/2);
    r = s + w;
    
    % HDD
        b = pamdemod(r, 2);
        u_hdd = decoderHDD(codeG,reshape(b, Nwc, n));
        ur_hdd = reshape(u_hdd, 1, Nwc*k);
        Pb_HDD(SNR + 2) = sum(xor(u, ur_hdd))/length(u); % Prático
        p(SNR + 2) = qfunc(sqrt(2 * snr_linear * (k/n))); % Teórico
    
    % SDD
        rr = reshape(r, Nwc, n);
        u_sdd = decoderSDD(codeG,rr);
        ur_sdd = reshape(u_sdd, 1, Nwc*k);
        Pb_SDD(SNR + 2) = sum(xor(u, ur_sdd))/length(u); % Prático
        Pb_pam(SNR + 2) = qfunc(sqrt(2 * snr_linear)); % Teórico

end

pesos_erro = sum(codeG.lut.e_hat'); % Padrões-de-erro
a_pesos = hist(pesos_erro, 0:n-k);
indices_a = 1:length(a_pesos);

for ii = indices_a
    Pc_sup(ii, 1:length(p)) = a_pesos(ii) .* (p.^(ii-1)) .* (1 - p).^(n - (ii-1)); % Pb vs Eb/No para HDD
end
Pc_sup = 1 - sum(Pc_sup); Pc_inf = Pc_sup./k;

pesos_pc = sum(codeG.c'); % Palavras-códigos por peso
A_pesos = hist(pesos_pc, 0:n);
A_pesos = A_pesos(2:end);
indices_A = 1:length(A_pesos);

snr_linear = 10.^(SNR_l./10); % Pb vs Eb/No para SDD
for ii = indices_A
    Pc_sdd(ii, 1:length(snr_linear)) = A_pesos(ii) .* qfunc(sqrt((2 * ii * (k/n)).*snr_linear));
end
Pc_sdd = sum(Pc_sdd);


figure(1);semilogy(SNR_l, Pc_sup, 'r');hold on;semilogy(SNR_l, Pb_HDD, 'm');hold on;semilogy(SNR_l, Pc_inf, 'b');
legend('Limitante superior', 'HDD prático', 'Limitante inferior');
title('Pb vs. EbNo');xlabel('Eb/No [dB]');ylabel('BER');
hold off;grid on;

figure(2);semilogy(SNR_l, Pc_sdd, 'r');hold on;semilogy(SNR_l, Pb_SDD, 'b');
legend('Limitante superior', 'SDD prático');
title('Pb vs. EbNo');xlabel('Eb/No [dB]');ylabel('BER');
hold off;grid on

figure(3);semilogy(SNR_l, Pb_HDD, 'm');hold on;semilogy(SNR_l, Pb_SDD, 'b');hold on;semilogy(SNR_l, Pb_pam, 'r');
legend('HDD', 'SDD', 'Não-codificado');
title('Pb vs. EbNo');xlabel('Eb/No [dB]');ylabel('BER');
hold off;grid on;