function gam = sphere_fun(a, c0, c1, h, w)

if nargin == 5
  a = w;
end

gam = zeros(1,length(h));

for i = 1:length(h)
    if h(i) <= a
        gam(i) = c0 + c1 * (3*norm(h(i))/2/a - norm(h(i))^3/2/a^3);
    else
        gam(i) = c0 + c1;
    end
end
