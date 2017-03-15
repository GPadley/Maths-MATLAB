function [xout, yout] = RK4second (xin, yin, h, tin, func1, func2)

	k1x = h*feval(func1, xin ,yin, tin); %approximating the first constants for the RK4th order 3/8 Method
    k1y = h*feval(func2, xin ,yin, tin);
	k2x = h*feval(func1, xin + k1x/3, yin + k1y/3, tin+h/3); %second
	k2y = h*feval(func2, xin + k1x/3, yin + k1y/3, tin+h/3);
	k3x = h*feval(func1, xin  - k1x/3 + k2x, yin - k1y/3 + k2y, tin+2*h/3); %third
	k3y = h*feval(func2, xin  - k1x/3 + k2x, yin - k1y/3 + k2y, tin+2*h/3);
	k4x = h*feval(func1, xin + k1x - k2x + k3x, yin + k1y - k2y + k3y, tin+h); %fourth
    k4y = h*feval(func2, xin + k1x - k2x + k3x, yin + k1y - k2y + k3y, tin+h);

	xout = xin + (k1x + 3*k2x + 3*k3x + k4x)/8;
	yout = yin + (k1y + 3*k2y + 3*k3y + k4y)/8;
end
