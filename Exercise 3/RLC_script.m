clear;
close all;

R = 250; L = 650*10^-3; C = 3*10^-6; %Impedance values for the components
w1 = 2*pi*500; %frequency for the 500 Hz sinusoid
w2 = 2*pi*100; %frequency for the sinusoid
w3 = 2*pi*5; %frequency for the sinusoid
tc = 3*10^-6; %tau for the exponential decay input
y0 = 0; x0 = 500*10^-9; t0 = 0; %Initial conditions y is current, x is charge and t is time
h = 0.00001; %step size
tf = 0.015; %final condition
Vin = @(t) 5*sin(w1*t);
func1 = @(x, y, t) y; %y = q'
func2 = @(x, y, t) (Vin(t) - R*y - x/C)/L; %thesecond coupled equation

N = round((tf-t0)/h);

ya = zeros(1,N); xa = zeros(1,N); ta = zeros(1,N); in = zeros(1,N);

xa(1) = x0; ya(1) = y0; ta(1) = t0; in(1) = Vin(t0);

for i = 1:N-1
	[xa(i+1), ya(i+1)] = RK4second (xa(i), ya(i), h, ta(i),func1, func2);
    ta(i+1) = ta(i) + h;
    in(i+1) = Vin(ta(i+1));
end

figure;
Vout = ya.*R;
subplot(2,1,1);
plot(ta, Vout);
grid on;
xlabel('Time/s'); ylabel('Voltage Out/V');
title('R*dq/dt with a 500 Hz Sine Wave Input')
subplot(2,1,2);
plot(ta, in);
grid on;
xlabel('Time/s'); ylabel('Voltage In/V');
title('500 Hz Sine Wave Input')
