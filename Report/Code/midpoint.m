function [x,y] = midpoint(func, x0, y0, xf, h)
N = round((xf - x0)/h);
arrx = zeros(1,N);
arry = zeros(1,N);
arrx(1) = x0;
arry(1) = y0;
for i = 1:N-1
    k1 = feval(func,arrx(i),arry(i));
    k2 = feval(func, arrx(i) + 0.5*h, arry(i) + 0.5*h*k1);
    arry(i+1) = arry(i) + h*((1/4)*k1 + (3/4)*k2);
    arrx(i+1) = arrx(i) + h;
end
x = arrx; y = arry;