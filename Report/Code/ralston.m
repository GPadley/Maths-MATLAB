function [t, vout] = ralston(func,t0,x0,tf,h)
N = round((tf-t0)/h);
arrt = zeros(1,N);
arrx = zeros(1,N);
arrt(1) = t0;
arrx(1) = x0;
for i = 1 : N-1
    k1 = feval(func, arrt(i), arrx(i));
    k2 = feval(func, arrt(i)+(2/3)*h, arrx(i)+(2/3)*h*k1);
    arrx(i+1) = arrx(i) + (h/4)*(k1 + 3*k2);
    arrt(i+1) = arrt(i) + h;
end
vout = arrx; t = arrt;