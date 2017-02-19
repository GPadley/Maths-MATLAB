clear all
R = 250; L = 650*10^-3; C = 3*10^-6; %Impedance values for the components
f = 500; w = 2*pi*f; %frequency for the sinusoid
tc = 3*10^-6; %tau for the exponential decay input
c1 = R/L; c2 = 1/(L*C); %ODE equation constants
y0 = 0; x0 = 500*10^-9; t0 = 0; %Initial conditions y is current, x is charge and t is time
h = 0.0000001; %step size
tf = 0.03; %final condition
func1 = @(x, y, t) y;
func2 = @(x, y, t) (5/L)*sin(w*t) - c1*y - c2*x;
N = round((tf-t0)/h);

ya = zeros(1,N); xa = zeros(1,N); ta = zeros(1,N); in = zeros(1,N);

xa(1) = x0; ya(1) = y0; ta(1) = t0; in(1) = 5*exp(-0);

for i = 1:N-1
	[xa(i+1), ya(i+1), ta(i+1)] = RK4second (xa(i), ya(i), h, ta(i),func1, func2);
    in(i+1) = 5*sin(w*ta(i+1));
end

figure;
Vout = ya.*R;
plot(ta, Vout);
grid on;
xlabel('Time/s'); ylabel('Voltage Out/V');
title('Voltage out of a RLC circuit with a Square Wave input')
figure;
plot(ta, in);
grid on;
xlabel('Time/s'); ylabel('Voltage In/V');
title('Square Wave input')
