function [t, y] = ralston(func,t0,y0,tf,H)
N = round((tf-t0)/H);
arrt = zeros(1,N);
arry = zeros(1,N);
arrt(1) = t0;
arry(1) = y0;
 
for j = 1 : N-1
    k1 = feval(func, arrt(j), arry(j));
    k2 = feval(func, arrt(j)+(2/3)*H, arry(j)+(2/3)*H*k1);
    arry(j+1) = arry(j) + (H/4)*(k1 + 3*k2);
    arrt(j+1) = arrt(j) + H;
end
y = arry; t = arrt;
end


