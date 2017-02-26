function [t,y] = heun(func,t0,y0,tf,h)
N = round((tf-t0)/h);
arrt = zeros(1,N);
arry = zeros(1,N);
arrt(1) = t0;
arry(1) = y0;

for i = 1:N
    k1 = feval(func, arrt(i), arry(i));
    k2 = feval(func, arrt(i) + h, arry(i) + k1*h);
    arry(i+1) = arry(i) + h*0.5*(k1 + k2);
    arrt(i+1) = arrt(i) + h;
end
t= arrt;
y = arry;
