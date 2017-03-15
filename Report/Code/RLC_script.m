clear;
close all;

R = 250; L = 650*10^-3; C = 3*10^-6; %Impedance values for the components
w1 = 2*pi*500; %frequency for the 500 Hz sinusoid
w2 = 2*pi*100; %frequency for the sinusoid
w3 = 2*pi*5; %frequency for the sinusoid
tc = 3*10^-6; %tau for the exponential decay input
y0 = 0; x0 = 500*10^-9; t0 = 0; %Initial conditions y is current, x is charge and t is time
h = 0.00001; %step size

tf1 = 0.02; %final condition for Vin1
tf2 = 0.1; %final condition for Vin2
tf3 = 0.20; %final condition for Vin3
tf4 = 0.01; %final condition for Vin4
tf5 = 0.05; %final condition for Vin5
tf6 = 0.25; %final condition for Vin6
tf7 = 0.03; %final condition for Vin7
tf8 = 0.03; %final condition for Vin8

Vin1 = @(t) 5*sin(w1*t); %sine 500 Hz
Vin2 = @(t) 5*sin(w2*t); %sine 100 Hz
Vin3 = @(t) 5*sin(w3*t); %sine 5 Hz
Vin4 = @(t) 5*square(w1*t); %square 500 Hz
Vin5 = @(t) 5*square(w2*t); %square 100 Hz
Vin6 = @(t) 5*square(w3*t); %square 5 Hz
Vin7 = @(t) 5*exp(-t/tc); %exponential decay
Vin8 = @(t) 5; %step response

func = @(x, y, t) y; %y = q'
func1 = @(x, y, t) (Vin1(t) - R*y - x/C)/L; %the second coupled equation
%remember to change numbers for Vin and tf to get correct graph and timescale
N = round((tf1-t0)/h); %number of time steps

ya = zeros(1,N); xa = zeros(1,N); ta = zeros(1,N); in = zeros(1,N);

xa(1) = x0; ya(1) = y0; ta(1) = t0; in(1) = Vin(t0);

for i = 1:N-1
	[xa(i+1), ya(i+1)] = RK4second (xa(i), ya(i), h, ta(i),func, func1);
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
