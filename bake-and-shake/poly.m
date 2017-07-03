function [p,pprime] = poly(a, z)

% find the first derivative at k for newton's method'

%a is the one-dimensional coefficient matrix of the polynomial
%b will be the one-dimensional resulting coefficient matrix when p is
%divided by z

b = zeros(length(a));
k = 0;
c = zeros(length(b));
n = length(a);

%to find p(z), use the algorithm given
%p(z) = b(n+1)
b(1) = a(1);
for k = 2:n
    b(k) = a(k) + z*b(k-1);
end
%then using this b(n), find p'(z) - also given
%p'(z) = c(n)
c(1) = b(1);
for k = 2:n
    c(k) = b(k) + z*c(k-1);

end
p = b(k);
pprime = c(k-1);
