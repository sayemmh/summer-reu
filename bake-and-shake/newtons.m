function [] = newton()
% calculate the roots of a polynomial using Newton's method.

% coefficient matrix
a = [2, 2]

% absolute error for Newton iteration
abserr = 0.5

% maximum iterations
itmax = 10

% initial condition
init = 1

x = linspace(-100,100,200);
f = polyval(a, x);

plot(x, f);

%now use Newton's method to find a root
bool = 1;
xk = init;
xk1 = 0;
k = 1;

% secant method for finding fprime derivative + epsilon when given the data
% understand bake and shake for e''
% coding of shake step

while(bool == 1)

   if(bool == 1)
        aprime = polyder(a);

        f = polyval(a, xk)
        fprime = polyval(aprime, xk)

        xvals(k) = xk;
        pvals(k) = f;
        kvals(k) = k;

        xk = xk - f / fprime;
        k = k + 1;

   end

    if(k < itmax) && (abs(xk - xk1) > abserr)
        bool = 1;
    else
        bool = 0;
    end

end

iteration = (kvals)'
xvalue = (xvals)'
fvalue = (pvals)'
