clear all;
%close all;
t0 = 0; tf = 0.02;
y0 = 0;
h = 0.001;

vin = 4;
z = 150*10^(-6);
T = 150*10^(-6);
t = t0: T : tf;
f = 1/T;
%Vin = @(t) vin*exp(-(t.^2)/z);
Vin =@(t) sin(2*pi*f*t);

R = 0.5;
L = 1.5 * 10^(-3);
% y = iL(t)
func = @(t,y) (Vin(t) - R*y)/L;
[t,y] = heun(func,t0,y0,tf,h);
Vout = Vin(t) - R*y;
figure;
plot(t, Vout, 'b');
title 'Heuns for impulsive signal'
xlabel 't(s)'
ylabel 'Vout(V)'
