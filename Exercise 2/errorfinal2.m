clear
R = 0.5;
L = 1.5 * 10^(-3);
t0 = 0;
y0 = 0;
N=0;
currentpre=0;
T=150*10^(-6);
w=2*pi/T;
tf = 0.0005;%total running time
M=10; %choose 50 different h values
h=0.0000004:0.0000004:M*0.0000004;%the interval is 0.00006
Vin =@(t) 6*cos(w*t);
%Vout_exact=@(t) -0.00076*exp(1000/3*t)*(pi*sin(40*pi*t/3)+25*cos(40*pi*t/3))/(pi^2+625);
Vout_exact=@(t) -(12/(1600*pi^2+1))*exp(-1000/3.*t)+12*40*pi*sin(40000*pi.*t/3)/(1600*pi^2+1)+12*cos(40000*pi.*t/3)/(1600*pi^2+1);
func =@(t, y) (Vin(t) - R*y)/L;
error_h=zeros(1,M);
for i=1:M 
    [t, y] = ralston(func,t0,y0,tf,h(i));
    [~,s]=size(t);
    z=zeros(1,s);
    for a=1:s
    z(a)=feval(Vout_exact,t(a));
    end
    error=z - y;
    error_h(i)=mean(error);
end
plot(log(h),log(abs(error_h)))
title('loglog plot of error versus h')
ylabel('error ')
xlabel('h')

 
 
 
 
 
 


