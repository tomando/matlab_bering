function gam = erf_fun(a, c0, c1, h, w)


nug = c0;
r = c0 + c1;
b = w(1);

if length(w) == 2
  a = w(2);
end

count = 1;
while abs(c0 - nug + .5*c1*(1+erf( (0-a/2)/b ))) > 1e-6
  c0 = nug - .5*c1*(1+erf( (0-a/2)/b ));
  c1 = r - c0;
  if c0 < 0
    %fprintf(1, 'Warning: c0 is negative\n');
    count = count+1;
  end
%   if count > 1e3
%     c0
%   end

end

gam = c0 + .5*c1*(1+erf( (h-a/2)/b ));

gam = gam';
