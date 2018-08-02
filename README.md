# Comunicações Móveis

Os experimentos foram realizados na disciplina de Comunicações móveis no curso de Engenharia de Telecomunicações do Instituto Federal de Santa Catarina - IFSC.

Para executar os códigos foi utilizado o software Matlab.

### Transmissão binária

Este experimento propôs simular uma transmissão binária com **modulação PCM**, para tal utilizou-se um som de coruja para a verificação dos parâmetros de Canal AWGN com SNR variando entre 0,5,10 e 100 e coeﬁciente k variando 3, 5 e 8; Utilize o arquivo [Own.wav](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/owl.wav) para executar o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/transmissao_binaria.m). Caso deseje maior aprofundamento teórico, verifique o [relatório de experimento](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/transmissao_binaria.pdf).

### MPSK

A modulação PSK (Phase Shift Keying) é baseada em alteração da fase, ou seja, o sinal digital altera a fase da portadora deslocando para transmissão da informação original.

* Experimento que utiliza uma sequência de informação com 10 bits, para gerar as formas dos sinais modulados em PSK. Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/ASK_PSK_FSK.m).

* Experimento que compara 16-PSK e 16-QAM considerando o aspecto de SNR (relação sinal ruído). Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/16PSK_16QAM.m).

* Experimento que compara MPSK, considerando os níveis de 2,4,8 e 16 para demonstrar o aspecto de SNR (relação sinal ruído). Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/MPSK.m).

O [relatório de experimento](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/ASK_MPSK_FSK_MQAM.pdf) apresenta os experimentos indicados acima.

### MQAM

A modulação QAM (Quadrature Amplitude Modulation) é baseada em alteração da fase, amplitude e frequência do sinal, ou seja, o sinal digital altera essas características na portadora para transmissão da informação original.

* Experimento que utiliza uma sequência de informação com 10 bits, para gerar as formas dos sinais modulados em QAM. Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/ASK_PSK_QAM.m).

* Experimento que compara 16-PSK e 16-QAM considerando o aspecto de SNR (relação sinal ruído). Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/16PSK_16QAM.m).

* Experimento que compara MQAM, para os níveis de 4, 16 e 64. Comparação realizada com relação a probabilidade de erro de símbolo e a SNR (relação sinal ruído). Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/MQAM.m).

* Experimento que simula um modulador/demodulador em quadratura utilizando 16-QAM, e demonstrando a representação complexa do sinal. Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/16QAM.m).

O [relatório de experimento](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/ASK_MPSK_FSK_MQAM.pdf) apresenta os experimentos indicados acima.

### ASK
A modulação ASK (Amplitude Shift Keying) é baseada em alteração da amplitude, ou seja, o sinal digital altera a amplitude da portadora para transmissão da informação original.

* Experimento que utiliza uma sequência de informação com 10 bits, para gerar as formas dos sinais modulados em ASK. Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/ASK_PSK_QAM.m).

### FSK
A modulação FSK (Frequency Shift Keying) é baseada em alteração da frequência, ou seja, o sinal digital altera a frequência da portadora para transmissão da informação original.

* Experimento que utiliza uma sequência de informação com 10 bits, para gerar as formas dos sinais modulados em FSK. Verifique o [código experimental](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/ASK_PSK_FSK.m).

# Comunicações Móveis II
A disciplina ainda está em execução, portanto os materiais ainda serão modificados.

Verifique o diretório [COM II](https://github.com/leticiacoelho/Comunicacoes-Moveis/tree/master/COMII) para experimentos e exemplos.

* [Convolução cíclica](https://github.com/leticiacoelho/Comunicacoes-Moveis/blob/master/COMII/convolucao_ciclica.m) - Convolução para domínio discreto.

