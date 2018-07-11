% Define as caracteristicas do Sinal

A0 = 1.1;
Ac = 1;

fa = 200e3;
t = [0:1/20e4:1];
fr = [-fa/2:1:fa/2];

m_t = cos(2*pi*t*1e3); % Sinal banda-base
c_t = cos(2*pi*t*10e3) % Sinal da portadora

% Variar o 'fator de modulação' (0.25, 0.5, 0.75, 1 e 1.5)
Am1=0.25;Am2=0.5;Am3=0.75;Am4=1;Am5=1.5;
s_t_025= (A0 +Am1.*m_t)*Ac.*c_t; % Sinal modulado
s_t_05= (A0 +Am2.*m_t)*Ac.*c_t; % Sinal modulado
s_t_075= (A0 +Am3.*m_t)*Ac.*c_t; % Sinal modulado
s_t_1= (A0 +Am4.*m_t)*Ac.*c_t; % Sinal modulado
s_t_15= (A0 +Am5.*m_t)*Ac.*c_t; % Sinal modulado

figure(1);
subplot(511);plot(t,s_t_025);xlim([0 8e-3]);title('Modulação AM DSB - Fator de modulação 0.25');xlabel('seg');ylabel('V');
subplot(512);plot(t,s_t_05);xlim([0 8e-3]);title('AM DSB - Fator de modulação 0.5');xlabel('seg');ylabel('V');
subplot(513);plot(t,s_t_075);xlim([0 8e-3]);title('AM DSB - Fator de modulação 0.75');xlabel('seg');ylabel('V');
subplot(514);plot(t,s_t_1);xlim([0 8e-3]);title('AM DSB - Fator de modulação 1');xlabel('seg');ylabel('V');
subplot(515);plot(t,s_t_15);xlim([0 8e-3]);title('AM DSB - Fator de modulação 1.5');xlabel('seg');ylabel('V');
