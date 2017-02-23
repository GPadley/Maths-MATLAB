clear;
close all;
Vin = @(t) 3.5;
R = 0.5; L = 1.5*10^(-3);
func =@(t, x) (Vin(t) - R*x)/L;
x0 = 0;
t0 = 0;
tf = 0.005;
h = 0.00001;
[t, x] = ralston(func,t0,x0,tf,h);
vout = 3.5-R*x;
plot(t, vout);
title 'Ralston Vin = 3.5V'
