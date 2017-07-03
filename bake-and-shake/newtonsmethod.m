function [] = newton()
%   This is the main method that uses poly.m to calculate the roots of a
%   polynomial using Newton's method.

format long

% coefficient matrix
a = [2, 2];

% absolute error for Newton iteration
abserr = 0.5;

% maximum iterations
itmax = 10;

% initial condition
init = 1;

x = linspace(-100,100,200);
f = polyval(a, x);

plot(x, f);

%now use Newton's method to find a root
bool = 1;
xk = init;
xk1 = 0;
k = 1;

while(bool == 1)

   if(bool == 1)
        [p, pprime] = poly(a, xk);
        xvals(k) = xk;
        pvals(k) = p;
        kvals(k) = k;
        xk1 = xk - p / pprime;
        k = k+1;

   end

    if(k < itmax) && (abs(xk - xk1) > abserr)
        bool = 1;
    else
        bool = 0;
    end
    xk = xk1;

end

iteration = (kvals)'
xvalue = (xvals)'
fvalue = (pvals)'
