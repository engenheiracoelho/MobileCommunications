%% AM DSB-SC

% Modulação AM (Tempo)
% Características do sinal

fa = 200e3;
t = [0:1/20e4:1];
fr = [-fa/2:1:fa/2];

m_t = cos(2*pi*t*1e3); % Sinal banda-base
c_t = cos(2*pi*t*10e3) % Sinal da portadora
s_t = m_t.*c_t; % Sinal modulado

% Plot dos sinais
figure(1);
subplot(311);plot(t,m_t);xlim([0 8e-3]);title('Sinal');xlabel('seg');ylabel('V');
subplot(312);plot(t,c_t);xlim([0 8e-3]);title('Portadora');xlabel('seg');ylabel('V');
subplot(313);plot(t,s_t);xlim([0 8e-3]);title('Modulação AM DSB SC');xlabel('seg');ylabel('V');
