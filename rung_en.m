function [xout, yout] = rung_en (xin,yin,h,tin,func)

	k1 = h*feval(func,xin,yin,tin);
	k2 = h*feval(func,xin+h/3,yin + k1/3,tin);
	k3 = h*feval(func,xin+2*h/3,yin-k1/3+k2,tin);
	k4 = h*feval(func,xin+h,yin+k1-k2+k3,tin);

	xout=xin+h;
	yout=yin+(k1+3*k2+3*k3+k4)/8;