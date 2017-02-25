function [x,y] = heun(f,xi,yi,xf,h)
N = round((xf-xi)/h);
arrx = zeros(1,N);
arry = zeros(1,N);
arrx(1) = xi;
arry(1) = yi;

for i = 1:N
    yp = arry(i) + h*feval(f,arrx(i),arry(i));
    grad1 = feval(f,arrx(i),arry(i));
    grad2 = feval(f,arrx(i)+h, yp);
    yave = 0.5*(grad1 + grad2);
    arry(i+1) = arry(i) + h*yave;
    arrx(i+1) = arrx(i) + h;
end
x= arrx;
y = arry;
