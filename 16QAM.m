
%% 16-QAM

    clear all;
    close all;
    clc;

%% Parâmetros da informação - Modulação
    bits = 10;
    Rb = 1e3;
    up = 100; %comprimento
    fc = 4e3;
    fa = 10*fc;
        
    %Modulador QAM
    k = 4;
    M = 2.^k;
    N = 100;
    
    % Gera e manipula a informação
    info = randi([0 1],1,up);
    
%% Filtro NRZ - Modulação
    filtro_tx = ones(1,up);
    filtro_tx = flip(filtro_tx);% SNR maximizada   
    
%% Modulação QAM - Modulação
    QAM = qammod(info,M);
           
    % Separa parte real e imaginária
    info_real = real(QAM);
    info_imaginaria = imag(QAM);
    
%% Formata o sinal - Modulação
  
    real_filter = filter(filtro_tx,1, upsample(info_real,up));
    imaginario_filter = filter(filtro_tx,1,upsample(info_imaginaria,up));
    
    v = length(real_filter)/fa-(1/fa); t = [0:1/fa:v];
    
    figure(1)
    subplot(211);plot(t,real_filter);title('Informação - parte real');
    subplot(212);plot(t,imaginario_filter);title('Informação - parte imaginária');


%% Portadora - Modulação
    port_real = cos(2*pi*fc*t);
    port_imag = -sin(2*pi*fc*t);
    real_TX = real_filter.*port_real;
    imag_TX = imaginario_filter.*port_imag;
    info_TX = real_TX + imag_TX;
    
    scatterplot(QAM,M);title('Informação modulada');
    
    %Complexa
    QAM_c = filter(filtro_tx,1, upsample(QAM,N));
    QAM_mod = QAM_c.*exp(j*2*pi*fc*t);
    info_TX_c = real(QAM_mod);

    figure(2)
        subplot(211);plot(t,info_TX);title('Informação modulada');xlim([0 0.025]);
        subplot(212);plot(t,info_TX_c);title('Informação modulada complexa');xlim([0 0.025]);
        
%% Portadora - Demodulação
    info_RX = info_TX;

    info_RX_real = info_RX.*port_real;
    info_RX_ima = info_RX.*port_imag;

%% Filtro passa baixa - Demodulação
    Wc = (fc)./(fa/2);
    FPB_fir = fir1(40,Wc,'low'); 
    
    % FPB - parte real
        FPB_real=filter(FPB_fir,1,info_RX_real); 
    % FPB - parte imaginaria
        FPB_imag=filter(FPB_fir,1,info_RX_ima);     

    figure(3);
    subplot(211);plot(t,FPB_real);ylim([-1.7 -1.3]);xlim([0 0.05]);title('Informação filtrada - parte real');
    subplot(212);plot(t,FPB_imag);xlim([0 0.05]);title('Informação filtrada - parte imaginaria');

%% Amostragem do sinal - Demodulação    
    
    real_amos = FPB_real(N:N:end);
    imag_amos = FPB_imag(N:N:end);

    % Formula informação com sinal complexo
    info_complex = real_amos + (j*imag_amos);

%% Demodulação 16-QAM
    
	QAM_demod = qamdemod(info_complex,M);

    % Complexa
    info_RX_c = info_TX_c;
    info_RX_c_real = (info_RX_c.*exp(-1j*2*pi*fc*t))*2;

    % FPB
        FPB_c_real = filter(FPB_fir,1,info_RX_c_real);

    % Amostragem
        real_amos_c = FPB_c_real(N:N:end);
     
    % Demodulacao
        demod_c = qamdemod(real_amos_c,M);
  
    figure(4)
    subplot(211);plot(t,info_RX);title('Informação demodulada');xlim([0 0.025]);
    subplot(212);plot(demod_c);title('Informação demodulada complexa');ylim([-0.1 1.1]);
        
    figure(5);
    subplot(311);plot(info);title('Informação original');xlim([0 50]);ylim([-0.1 1.1]);
    subplot(312);plot(t,info_TX);title('Informação modulada');xlim([0 35e-3]);
    subplot(313);plot(demod_c);title('Informação demodulada');ylim([-0.1 1.1]);xlim([0 50]);
    
    