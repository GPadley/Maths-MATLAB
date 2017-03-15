clear;
close all;

R = 0.5; %resistor value
L = 1.5*10^(-3); %inductance
Vin1 = @(t) 3.5*exp(-t/t1); %first order exponential decay
Vin2 = @(t) 3.5*exp(-(t.^2)/t2); %second order exp decay
Vin3 =@(t) 3.5; %step response
Vin4 =@(t) 4*sin(2*pi*f1*t); %sine wave
Vin5 =@(t) 4*square(2*pi*f1*t); %square wave
Vin6 =@(t) 4*sawtooth(2*pi*f1*t); %sawtooth

t1 = 150e-6; %first order time constant
t2 = 150e-12; %second order time constant
f1 = 1/(15e-6) %frequency 1
f2 = 1/(150e-6) %frequency 2
f3 = 1/(400e-6) %frequency 3
f4 = 1/(1100e-6) %frequency 4

func =@(t, x) (Vin1(t) - R*x)/L;
x0 = 0;
t0 = 0;
tf = 0.005;
h = 0.00000001;
[t, x] = ralston(func,t0,x0,tf,h);
vin = Vin1(t);
vout = vin-R*x;
plot(t, vout);
grid on;
title 'Ralston'
xlabel('Time/s'); ylabel('Voltage Out/V');
