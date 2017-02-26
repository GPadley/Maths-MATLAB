function [t, y] = ralston(func,t0,y0,tf,h)
N = round((tf-t0)/h);
arrt = zeros(1,N);
arry = zeros(1,N);
arrt(1) = t0;
arry(1) = y0;
for i = 1 : N-1
    k1 = feval(func, arrt(i), arry(i));
    k2 = feval(func, arrt(i)+(2/3)*h, arry(i)+(2/3)*h*k1);
    arry(i+1) = arry(i) + (h/4)*(k1 + 3*k2);
    arrt(i+1) = arrt(i) + h;
end
y = arry; t = arrt;
end