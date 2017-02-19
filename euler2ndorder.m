x0 = 0;
y0 = 0;
t0 = 0;
h = 0.01;
tf = 50;
func1 = @(t, x, y) y;
func2 = @(t, x, y) sin(t) - 3*x - 2*y;
N = round((tf-t0)/h);

ya = zeros(1,N); xa = zeros(1,N); ta = zeros(1,N);

xa(1) = x0; ya(1) = y0; ta(1) = t0;

for i = 1:N-1
	xi = xa(i); yi = ya(i); ti = ta(i);
	klx = feval(func1, ti, xi, yi);
	kly = feval(func2, ti, xi, yi);
	
	phix = klx;
	phiy = kly;
	
	ya(i+1) = yi + h*phiy;
	xa(i+1) = xi + h*phix;
	ta(i+1) = ti + h;
end

figure;
plot(ta, xa);