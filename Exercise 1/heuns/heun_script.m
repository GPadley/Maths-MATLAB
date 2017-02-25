clear;
close all;
Vin = @(t) 3.5;
R = 0.5;
L = 1.5 * 10^(-3);
t0 = 0;
x0 = 0;
tf = 0.005;
h = 0.0001;
% x = iL(t)
func = @(t,x) (Vin(t) - R*x)/L;
[t,x] = heun(func,t0,x0,tf,h);
Vout =3.5 - R*x;
plot(t, Vout);
title 'Heuns for Vin = 3.5V'
xlabel 't(s)'
ylabel 'Vout(V)'
