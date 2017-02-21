clear;
close all;
Gbulb = tf([1],[0.038 1]);
Gamp = tf([1000], [1 5 1000]);
G3 = Gamp*Gbulb;
t = 0:0.01:0.19;

f = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10];
a_out = [0.15, 0.16, 0.16, 0.16,0.16,0.17,0.18,0.26,0.38,0.8,0.48,0.2,0.11,0.072,0.052,0.04,0.03,0.026,0.022, 0.019];
w_exp = 2*pi*f;
a_in = 0.2;
gain_exp = a_out/a_in;
dbgain_exp = 20*log10(gain_exp);

G3snum = 1000;
G3sden = [0.038 1.19 43 1000];
s = (i*w_exp);
G3s_gain = 1000./abs(polyval(G3sden,s));
dbG3s_gain = 20*log10(G3s_gain);

figure;
plot(f, dbG3s_gain, '-o', f, dbgain_exp, '-x');
legend('Theoretical', 'Experimental');
grid;
xlabel('Frequency/Hz');
ylabel('Gain/dB');
title('Theoretical Frequency Response and Experimental Frequency Response');
C = tf([1 5 1000],[1 100 0]);


Cz = c2d(0.0791*C, 0.01, 'zoh');
Hs = G3*Cz;
clsys = feedback(Hs, 1);
plot(Cz);