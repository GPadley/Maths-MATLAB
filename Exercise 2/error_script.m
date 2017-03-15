Vin =@(t,x) 6*cos(2*pi*t/(150*10^(-6)));%Vin is a cosine wave with amplitude of 6V and time period of 150ms
R = 0.5;
L = 1.5 * 10^(-3);%initialize the parameter according to given conditions
t0 = 0;
x0 = 0;
tf = 0.0005;%function run for 0.0005s
h = 0.000001;%the step size is 0.000001

% x = iL(t)
f = @(t,x) (Vin(t) - R*x)/L;
[t,Vout]=heun(f,t0,x0,tf,h);%call the function heun.m(or midpoint.m or ralston.m)
figure;
plot(t,Vout)%plot the graph for the numerical method vout vs t
title 'Numerical method'

%exact(b)=-0.00076*exp(-1000/3*t(b))+0.0955*sin(41900*t(b))+0.00076*cos(41900*t(b));
Vout_exact=@(t) -(12/(1600*pi^2+1))*exp(-1000/3.*t)+12*40*pi*sin(40000*pi.*t/3)/(1600*pi^2+1)+12*cos(40000*pi.*t/3)/(1600*pi^2+1);
%work out Vout_exact
exact = Vout_exact(t);
error=exact-Vout;%work out Error


figure;
plot(t,exact)%plot the graph of exact vout vs t
title('exact function')

figure;
plot(t,error)%plot the graph of error vout vs t

%max(abs(error))

title('error fuction for heun for Vin = 6V')
xlabel('xa')
ylabel('error')



