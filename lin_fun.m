function gam = lin_fun(a, c0, c1, h, w)

if nargin == 5
  a = w;
end

gam = zeros(1,length(h));

for i = 1:length(h)
    if h(i) <= a
        gam(i) = c0 + c1/a*norm(h(i));
    else
        gam(i) = c0 + c1;
    end
end
