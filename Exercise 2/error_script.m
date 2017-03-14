Vin =@(t,x) 6*cos(2*pi*t/(150*10^(-6)));
R = 0.5;
L = 1.5 * 10^(-3);
t0 = 0;
x0 = 0;
tf = 0.005;
h = 0.00001;
%t=t0:T:tf;
%T=150*10^6;
%a=size(t);
%exact=zeros(1,a);
%error=zeros(1,a);

% x = iL(t)
f = @(t,x) (Vin(t) - R*x)/L;
[t,Vout]=ralston(f,t0,x0,tf,h);
figure;
plot(t,Vout)
title 'Numerical method'

%exact(b)=-0.00076*exp(-1000/3*t(b))+0.0955*sin(41900*t(b))+0.00076*cos(41900*t(b));
Vout_exact=@(t) -(12/(1600*pi^2+1))*exp(-1000/3.*t)+12*40*pi*sin(40000*pi.*t/3)/(1600*pi^2+1)+12*cos(40000*pi.*t/3)/(1600*pi^2+1);

exact = Vout_exact(t);
error=exact-Vout;


figure;
plot(t,exact)
title('exact function')

figure;
plot(t,error)

%max(abs(error))

title('error fuction for heun for Vin = 6V')
xlabel('xa')
ylabel('error')



