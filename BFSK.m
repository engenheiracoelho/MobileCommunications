%% BFSK

    clear all;
    close all;
    clc;

%% Parâmetros da informação
    bits = 10;
    Rb = 1e3;
    up = Rb;
    Tb = 1/Rb;
    f1 = 10e3;
    f2 = 50e3;
    ts = Tb/up;
    t = 0:ts:(up*Tb)-ts; 
    fa = Rb*up;
    
    info = randint(1,up);
    info_up = rectpulse(info,up);
    info_mod = info_up*4+1; % Transforma os níveis para 0V - 5V
      
    figure(1);
    subplot(311);plot(info);title('Informação');ylim([-0.05 1.05]);xlim([0 100]);
    subplot(312);plot(info_up);title('Informação NRZ');ylim([-0.05 1.05]);xlim([0 10e5]);
    subplot(313);plot(info_mod);title('Informação com níveis');ylim([-0.05 5.2]);xlim([0 10e5]);
   
%% Utiliza a portadora
    port1 = cos(2*pi*f1*t.*info_mod);

    figure(2);
    subplot(211);plot(info_mod);title('Informação com níveis');ylim([-0 5.2]);xlim([0 50e3]);
    subplot(212);plot(port1);title('Sinal BFSK');ylim([-1.05 1.05]);xlim([0 50e2]);
 
%% Filtro passa faixa
    %FPF1
        % Organizar componentes
            pf1 = fir1(200,[9500 10500]/(fa/2));
            PF_filter=filter(pf1,1,port1);
    %FPF2
        % Organizar componentes
            pf2 = fir1(200,[49500 50500]/(fa/2));
            PF_filter2=filter(pf2,1,port1);
            
    figure(3);
    subplot(211);plot(PF_filter);hold on;plot(PF_filter2);hold off;title('Sinal com filtro passa faixa');ylim([-1.1 1.2]);xlim([0 5e3]);

    
%% Filtro passa baixa
    %FPB1
        % Retificar o sinal
            Sinal1=abs(PF_filter);
        % Retirar componentes
            pb1 = fir1(200,100/(fa/2),'low');
            PB_filter=filter(pb1,1,Sinal1);
    %FPB2
        % Retificar o sinal
            Sinal2=abs(PF_filter2);
        % Retirar componentes
            PB_filter2=filter(pb1,1,Sinal2); 
            
        subplot(212);plot(PB_filter);hold on;plot(PB_filter2);hold off;title('Sinal com filtro passa baixa');ylim([-0.1 0.7]);xlim([0 5e3]);
    
%% Determinar o limiar
	limiar = 0.4
    L= (PB_filter(up/2:up:end)<limiar)*1;
    figure(4);subplot(211);stem(L);xlim([0 1e2]);
    subplot(212);plot(L);xlim([0 1e2]);
