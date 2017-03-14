clear;
close all;
tc = 1100e-6;
f = 1/tc;
Vin = @(t) 4*sawtooth(2*pi*f*t);
R = 0.5; L = 1.5*10^(-3);
func =@(t, x) (Vin(t) - R*x)/L;
x0 = 0;
t0 = 0;
tf = 0.003;
h = 0.00000001;
[t, x] = ralston(func,t0,x0,tf,h);
vin = Vin(t);
vout = vin-R*x;
subplot(2,2,1);
plot(t, vout);
grid on;
title 'Ralston'
subplot(2,2,2);
[t, x] = midpoint(func,t0,x0,tf,h);
vout = vin-R*x;
plot(t, vout, 'g');
grid on;
title 'Midpoint'
subplot(2,2,3);
[t, x] = heun(func,t0,x0,tf,h);
vout = vin-R*x;
plot(t, vout, 'r');
grid on;
title 'Heun'
subplot(2,2,4);
plot(t, vin);
title 'Vin(t) = Sawtooth T = 1100us'
grid on;