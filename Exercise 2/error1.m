R = 0.5;
L = 1.5 * 10^(-3);
t0 = 0;
x0 = 0;
N=0;
currentpre=0;
T=150*10^(-6);
w=2*pi/T;
tf = 0.05;%total running time
M=50; %choose 50 different h values
h=0.00002:0.00002:M*0.00002;%the interval is 0.00006
for i=1:M
    N=round((tf)/h(i));
    t=0:h(i):(N-1)*h(i);%the maximum value is (N-1)*h(i) to make the size equal N
    Vin=6*cos(w*t);
    Vout_exact=-0.00076*exp(-1000/3.*t)+0.0955*sin(41900.*t)+0.00076*cos(41900.*t);
    func =@(t, y) (Vin(t) - R*y)/L;
    [t, y] = ralston(func,t0,y0,tf,h);
    error_mean=mean(error); %calculated the mean of error
    error_h(i)=error_mean;
end
plot(log(error_h),log(h))
title('error versus h')
ylabel('error in log10')
xlabel('h in log10')




