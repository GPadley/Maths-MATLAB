clear
x0 = 0;
y0 = 0;
t0 = 0;
h = 0.001;
tf = 50;

func1=@(t,x,y) y;
func2=@(t,x,y) sin(t)-3*x-2*y;

N=round((tf-t0)/h);

ya=zeros(1,N); xa=zeros(1,N); ta=zeros(1,N);
xa(1)=x0; ya(1)=y0;ta(1)=t0;
for i=1:N-1
	xi=xa(i);yi=ya(i); ti=ta(i);
	k1x=feval(func1,ti,xi,yi); %evaluate func1 at ti, xi, yi
	k1y=feval(func2,ti,xi,yi); %evaluate func2 at ti, xi, yi
	k2x=feval(func1,ti+h,xi+h*k1x,yi+h*k1y); %evaluate at ti+1, xi+1, yi+1
	k2y=feval(func2,ti+h,xi+h*k1x,yi+h*k1y);
	phix=(k1x+k2x)/2; %takes average of the 2
	phiy=(k1y+k2y)/2;
	ya(i+1)=yi+h*phiy; %next point created
	xa(i+1)=xi+h*phix;
	ta(i+1)=ti+h;
end
figure;
plot(ta,xa);
