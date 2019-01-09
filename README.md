# Mobile Communications

The experiments were created in the discipline of Mobile Communications in the Telecommunications Engineering course of the Federal Institute of Santa Catarina - IFSC.

Matlab software was used to execute the codes.

### Binary transmission

This experiment proposed to simulate a binary transmission with **PCM modulation**. An owl sound was used to verify the AWGN channel parameters with SNR (ranging 0, 5, 10 and 100) and coefficient k (ranging 0, 5 and 8); Use the [Own.wav sound](https://github.com/leticiacoelho/MobileCommunications/blob/master/owl.wav) to run the [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/binary_transmission.m). If you want further theoretical analysis, check the [experiment report](https://github.com/leticiacoelho/MobileCommunications/blob/master/binary_transmission.pdf) (portuguese version).

### MPSK

The Phase Shift Keying (PSK) modulation is based on phase change, the digital signal changes the carrier phase by shifting to transmitting the original information.

* Experiment using a 10-bit information sequence to generate PSK modulated signal forms. Check the [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/ASK_PSK_FSK.m).

* Experiment comparing 16-PSK and 16-QAM considering the aspect of SNR (signal-to-noise ratio). Check the [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/16PSK_16QAM.m).

* Experiment comparing MPSK, considering levels of 2,4,8 and 16 to demonstrate the aspect of SNR (signal-to-noise ratio). Check the  [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/MPSK.m).

The [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/ASK_MPSK_FSK_MQAM.pdf) show the experiments indicated above.

### MQAM

The Quadrature Amplitude Modulation (QAM) modulation is based on a change in the phase, amplitude and frequency of the signal,  the digital signal changes these characteristics in the carrier to transmit the original information.

* Experiment using a 10-bit information sequence to generate the forms of the QAM modulated signals. Check the [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/ASK_PSK_QAM.m).

* Experiment comparing 16-PSK and 16-QAM considering the aspect of SNR (signal-to-noise ratio). Check the [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/16PSK_16QAM.m).

* Experiment that compares MQAM, for the levels of 4, 16 and 64. Comparison performed with respect to probability of symbol error and SNR (signal-to-noise ratio). Check the [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/MQAM.m).

* An experiment that simulates a quadrature modulator / demodulator using 16-QAM, and demonstrating the complex representation of the signal. Check the [experimental code](https://github.com/letiqueton/MobileCommunications/blob/master/16QAM.m).

The [experiment report](https://github.com/leticiacoelho/MobileCommunications/blob/master/ASK_MPSK_FSK_MQAM.pdf) shows the experiments indicated above.

### ASK
The Amplitude Shift Keying (ASK) modulation is based on amplitude change, ie the digital signal changes the amplitude of the carrier to transmit the original information.

* An experiment using a 10-bit information sequence to generate the forms of ASK-modulated signals. Check the [experimental code](https://github.com/letiqueton/MobileCommunications/blob/master/ASK_PSK_QAM.m).

### FSK
FSK (Frequency Shift Keying) modulation is based on frequency change, ie the digital signal changes the frequency of the carrier to transmit the original information.

* An experiment using a 10-bit information sequence to generate FSK modulated signal forms. Check the [experimental code](https://github.com/leticiacoelho/MobileCommunications/blob/master/ASK_PSK_FSK.m).

### Convolution
[Cyclic convolution] (https://github.com/leticiacoelho/MobileCommunications/blob/master/cyclic_convolution.m) - Convolution for discrete domain.
