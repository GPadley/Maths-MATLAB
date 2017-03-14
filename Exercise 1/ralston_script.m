clear;
close all;
t1 = 150e-6;
t2 = 150e-12;
Vin = @(t) 3.5*exp(-t/t1);
Vin2 = @(t) 3.5*exp(-(t.^2)/t2);
R = 0.5; L = 1.5*10^(-3);
func =@(t, x) (Vin(t) - R*x)/L;
func2 =@(t, x) (Vin2(t) - R*x)/L;
x0 = 0;
t0 = 0;
tf = 0.005;
h = 0.00000001;
[t, x] = ralston(func,t0,x0,tf,h);
vin = Vin(t);
vout = vin-R*x;
subplot(2,2,1);
plot(t, vout);
grid on;
title 'Ralston'
xlabel('Time/s'); ylabel('Voltage Out/V');
subplot(2,2,2);
[t, x] = midpoint(func,t0,x0,tf,h);
vout = vin-R*x;
plot(t, vout, 'g');
grid on;
title 'Midpoint'
xlabel('Time/s'); ylabel('Voltage Out/V');
subplot(2,2,3);
[t, x] = heun(func,t0,x0,tf,h);
vout = vin-R*x;h
plot(t, vout, 'r');
grid on;
title 'Heuns'
xlabel('Time/s'); ylabel('Voltage Out/V');
subplot(2,2,4);
plot(t, vin);
title 'Vin(t) = 3.5*exp(-t/tc)'
xlabel('Time/s'); ylabel('Voltage In/V');
grid on;