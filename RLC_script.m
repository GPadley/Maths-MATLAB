clear all
R = 250;
L = 650*10^-3;
C = 3*10^-6;
%c1 = R/L;
%c2 = 1/(L*C);
y0 = 0;
V0 = 0;
x0 = 500*10^-9;
t0 = 0;
h = 0.01;
tf = 50;
func1 = @(x, y, t) y;
func2 = @(x, y, t) step_func(t) - L*y - x/C;
N = round((tf-t0)/h);
xout  = 0;
yout = 0;
ya = zeros(1,N); xa = zeros(1,N); ta = zeros(1,N);

xa(1) = x0; ya(1) = y0; ta(1) = t0;

for i = 1:N-1
	[xa(i+1), ya(i+1)] = rung_en (xa(i),ya(i),h,ta(i),func2);

	ta(i+1) = ta(i) + h;
end

figure;
plot(ta, ya);
