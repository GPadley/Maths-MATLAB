Vin =@(t,x) 6*cos(2*pi*t/(150*10^(-6)));
R = 0.5;
L = 1.5 * 10^(-3);
t0 = 0;
x0 = 0;
tf = 0.005;
h = 0.00001;

% x = iL(t)
f = @(t,x) (Vin(t) - R*x)/L;

[t,Vout]=heun(f,t0,x0,tf,h);
figure;
plot(t,Vout);

title 'Numerical method'
exact=-0.00076*exp(-1000/3*t)+0.0955*sin(41900*t)+0.00076*cos(41900*t);
figure;
plot(t,exact);

title 'exact'

error=exact-Vout;
figure;
plot(t,error);

max(abs(error))

title('error fuction for heun for Vin = 6V')
xlabel('xa')
ylabel('error')

loglog(t,abs(error),'b')

title 'heun error for loglog plot'
xlabel 'log t(s)'
ylabel 'log Vout(t)'


