x = 0;
y = 2;
h = 0.03;
xf = 18;
N = round((xf-x)/h);
plot(x, y, '*');

hold on
    for i = 1:N
        y = y + h*(x+y);
        x = x + h;
        plot(x, y, 'b*');
    end
    
    xx = 0:h:xf;
    yy = 3*exp(xx) - xx - 1;
    plot(xx,yy,'b');