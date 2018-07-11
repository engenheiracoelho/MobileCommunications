%% AM DSB-SC

% Modulação AM (Tempo)
% Características do sinal

fa = 200e3;
t = [0:1/20e4:1];
fr = [-fa/2:1:fa/2];

% Modulação
m_t = cos(2*pi*t*1e3); % Sinal banda-base
c_t = cos(2*pi*t*10e3) % Sinal da portadora
s_t = m_t.*c_t; % Sinal modulado

% Demodulação
m_t_hat = s_t.*c_t; % multiplica o sinal final pela portadora.
f = fir1(34,(2e3/fa),'low');freqz(f,1,512); % Cria o filtro
fr=[-fa/2:1:fa/2];
m_t_filtrado = filter(f,1,m_t_hat); % Filtro o sinal
