clear;
close all;

x0 = 0;
h = 0.005; %Step size in the X direction

%input waves
Vin1 = @(x) tent(x);
Vin2 = @(x) sin(2*pi*x);
Vin3 = @(x) abs(sin(2*pi*x));
Vin4 = @(x) sin(pi*x);
Vin5 = @(x) =-40*x^4+72x^3-38x^2+6x;
Vin6 = @(x) 1-x;

%different boundary conditions

Bc = @(t) 0;
Bca = @(t) 0.75;
Bcb = @(t) 0.25;
Bc1 = @(t) 20*t;

xf = 1 + h; %Final value of X untitledplus one more step to complete the graph
t0 = 0; %Initial time value

k = 0.45*h^2; %due to v being max of 1/2 we use 0.45 and work out k relative to that, steps in time
tf = 200*k; %the end time is 250 steps in the k direction

N = round((xf-x0)/h); %number of steps in the x direction
M = round((tf - t0)/k); %number of steps in the t direction
v = k/(h^2); %recalculating the value of v

b = 1 - 2*v; %create the value of beta
ya = zeros(1,N); xa = zeros(1,N); %create empty arrays

xa(1) = x0; xa(N) = xf-h; ya(1) = Bc(0); ya(N) = Bc(0); %initialising the initial conditions

for i = 1:N-2
    xa(i+1) = xa(i) + h; %next step in x direction
	ya(i+1) = feval(Vin5, xa(i+1)); %calculate heat inital points
end

t = t0; %initial time value

plot(xa, ya, '.', 'markersize', 4); %plot graph at t = 0
hold on; %plots them all on the same graph

yn = ya; %to take the next time values

for a = 1:15 %plots the graph 15 times
    for i = 1:M %cycle through every time step
		ya(1) = Bc(t); ya(N) = Bc(t); %set boundary conditions
		for j = 2:N-1 %work out temp for next time step
            yn(j) = v*ya(j-1) + b*ya(j) + v*ya(j+1);
		end
		t = t+k; %change the time one step forward
        ya = yn; %replace ya with the next time array
    end
    plot(xa, ya, '.', 'markersize', 4); %plot heat
end
title 'Finite Difference of 1D Heat Equation -40x^4+72x^3-38x^2+6x'
xlabel 'Distance/cm'
ylabel 'Temperature/°C'
xlim([0, 1]);
