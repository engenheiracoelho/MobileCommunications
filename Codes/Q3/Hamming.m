%% Código de Golay
clear all;close all;clc;

Ncw = 100000; % Palavras-código
EbNo_list = -1:7;

code = HammingFunc(4, 7); % k = 4; n = 7;

u = randi([0 1], 1, Ncw*k); % Informação
info = reshape(u, Ncw, k);

c_mod = mod(info*code.g, 2); % Codificação da informação com o código
c_ham = reshape(c_mod, 1, Ncw*n);

info_mod = pammod(c_ham, 2); % Informação modulada

Eb = (info_mod * info_mod') / (k * Ncw); % Sinal transmitido e decodificado

for EbNo = EbNo_list
    EbNo_linear = 10^(EbNo/10)
    No = Eb / EbNo_linear;
    w = randn(1, n*Ncw) * sqrt(No/2);
    r = info_mod + w;
    % HDD
    b = pamdemod(r, 2);
    b_reshaped = reshape(b, Ncw, n);
    u_hdd = decodeHDD(b_reshaped, code);
    u_hdd_reshaped = reshape(u_hdd, 1, Ncw*k);
    % Prática HDD
    Pb_hdd(EbNo + 2) = sum(xor(u, u_hdd_reshaped))/length(u);
    % Teórico HDD
    p(EbNo + 2) = qfunc(sqrt(2 * EbNo_linear * (k/n)));
    % SDD
    r_reshaped = reshape(r, Ncw, n);
    u_sdd = decodeSDD(r_reshaped, code);
    u_sdd_reshaped = reshape(u_sdd, 1, Ncw*k);
    % Prática SDD
    Pb_sdd(EbNo + 2) = sum(xor(u, u_sdd_reshaped))/length(u);
    % Não-codificado (teórico)
    Pb_pam(EbNo + 2) = qfunc(sqrt(2 * EbNo_linear));
end

pesos_erro = sum(code.lut.e_hat'); % Padrões-de-erro por peso:
a_pesos = hist(pesos_erro, 0:n-k);
indices_a = 1:length(a_pesos);

for ii = indices_a
    Pc_sup(ii, 1:length(p)) = a_pesos(ii) .* (p.^(ii-1)) .* (1 - p).^(n - (ii-1)); %% Pb vs Eb/No para HDD limitantes superior e inferior teóricos:
end
Pc_sup = 1 - sum(Pc_sup);
Pc_inf = Pc_sup./k;

% Quantidade de palavras-códigos por peso:
pesos_pc = sum(code.c');
A_pesos = hist(pesos_pc, 0:n);
A_pesos = A_pesos(2:end);
indices_A = 1:length(A_pesos);

% Pb vs Eb/No para SDD limitantes superior teóricos:
EbNo_linear = 10.^(EbNo_list./10);
for ii = indices_A
    Pc_sdd(ii, 1:length(EbNo_linear)) = A_pesos(ii) .* qfunc(sqrt((2 * ii * (k/n)).*EbNo_linear));
end
Pc_sdd = sum(Pc_sdd);

figure(1)
semilogy(EbNo_list, Pc_sup, 'r');hold on;semilogy(EbNo_list, Pb_hdd, 'm');hold on;semilogy(EbNo_list, Pc_inf, 'b');
legend('Limitante superior', 'HDD prático', 'Limitante inferior')
title('Pb vs. EbNo');xlabel('Eb/No [dB]');ylabel('BER');hold off;grid on

%%
figure(2)
semilogy(EbNo_list, Pc_sdd, 'r');hold on;semilogy(EbNo_list, Pb_sdd, 'b');legend('Limitante superior', 'SDD prático')
title('Pb vs. EbNo');xlabel('Eb/No [dB]');ylabel('BER');hold off;grid on

%%
figure(3)
semilogy(EbNo_list, Pb_hdd, 'm');hold on;semilogy(EbNo_list, Pb_sdd, 'b');hold on;semilogy(EbNo_list, Pb_pam, 'r');
legend('HDD', 'SDD', 'Não-codificado');title('Pb vs. EbNo');xlabel('Eb/No [dB]');ylabel('BER');hold off;grid on