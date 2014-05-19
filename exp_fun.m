function gam = exp_fun(a, c0, c1, h, w)

if nargin == 5
  a = w;
end

gam = zeros(1,length(h));

for i = 1:length(h)
  gam(i) = c0 + c1 * (1 - exp(-3*norm(h(i))/a));
end
