clear
R = 0.5;
L = 1.5 * 10^(-3);
t0 = 0;
y0 = 0;
N=0;
currentpre=0;
T=150*10^(-6);%initialize the parameters in the given conditions
w=2*pi/T;%angular frequency of cosine wave
tf = 0.0005;%total running time
M=10; %choose 10 different h values
h=0.0000004:0.0000004:M*0.0000004;%the interval is 0.0000396
Vin =@(t) 6*cos(w*t);%Vin has amplitude of 6V and time period of 150ms
%Vout_exact=@(t) -0.00076*exp(1000/3*t)*(pi*sin(40*pi*t/3)+25*cos(40*pi*t/3))/(pi^2+625);
Vout_exact=@(t) -(12/(1600*pi^2+1))*exp(-1000/3.*t)+12*40*pi*sin(40000*pi.*t/3)/(1600*pi^2+1)+12*cos(40000*pi.*t/3)/(1600*pi^2+1);%Work out the Vout_exact
func =@(t, y) (Vin(t) - R*y)/L;
error_h=zeros(1,M);
for i=1:M
    [t, y] = ralston(func,t0,y0,tf,h(i));%call the function ralston.m
    [~,s]=size(t);
    z=zeros(1,s);%set an array
    for a=1:s
    z(a)=feval(Vout_exact,t(a));
    end
    error=z - y;%work out errors
    error_h(i)=mean(error);%calculate the mean of error of different h
end
plot(log(h),log(abs(error_h)))%plot loglog graph
title('loglog plot of error versus h')
ylabel('error ')
xlabel('h')

 
 
 
 
 
 


