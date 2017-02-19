function [x,y] = euler(func,xi,yi,xf,h)

N=round((xf-xi)/h);
ya=zeros(1,N); xa=zeros(1,N);
initialize values to zero

xa(1)=xi; ya(1)=yi;
for j=1:N-1
	ya(j+1)=ya(j) + h*feval(func, xa(j),ya(j));
	xa(j+1)=xa(j)+h; % increase x by stepsize
end
x=xa;y=ya; 