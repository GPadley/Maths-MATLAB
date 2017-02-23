clear;
close all;
x0 = 0; %First calue of X
h = 0.005; %Step size in the X direction
Vin = @(x) tent(x);
xf = 1 + h; %Final value of X plus one more step to complete the graph
t0 = 0; %Initial time value
k = 0.45*h^2; %due to v being max of 1/2 we use 0.45 and work out k relative to that, steps in time
tf = 300*k; %the end time is 250 steps in the k direction
N = round((xf-x0)/h); %number of steps in the x direction
M = round((tf - t0)/k); %number of steps in the t direction
v = k/(h^2); %recalculating the value of v
b = 1 - 2*v; %create the value of beta
ya = zeros(1,N); xa = zeros(1,N); %create empty arrays
xa(1) = x0; %initialising the initial conditions

for i = 1:N-1
    xa(i+1) = xa(i) + h; 
	ya(i+1) = feval(Vin, xa(i+1));
end

plot(xa, ya, '.', 'markersize', 4);
hold on;
yn = ya;
for a = 1:10
    for i = 1:M
        for j = 2:N-1
            yn(j) = v*ya(j-1) + b*ya(j) + v*ya(j+1);
        end
        ya = yn;
    end
    plot(xa, ya, '.', 'markersize', 4);
end
title 'Finite Difference of PDE 1D Heat Equation - tent(x)'
xlabel 'Distance/cm'
ylabel 'Temperature/°C'
xlim([0, 1]);
ylim([0, 1]);