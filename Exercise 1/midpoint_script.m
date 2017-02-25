clear;
close all;
R = 0.5;
L = 1.5*10^(-3);
Vin =@(t) 3.5;
%x = iL
func =@(t, y) (Vin(t) - R*y)/L;
t0 = 0; tf = 0.05;
y0 = 0;
h = 0.001;
[t,y] = midpoint(func, t0, y0, tf, h);
Vout = 3.5 - R*y;
plot(t, Vout,'b' );
title 'Midpoint methos for Vin = 3.5V'
xlabel 't(s)'
ylabel 'Vout(t)'

