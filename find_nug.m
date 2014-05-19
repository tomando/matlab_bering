function out = find_nug(var)

% Choose points
num_points = 3;

h = var.h(1:num_points);
g = var.gam(1:num_points);

% Remove nugget outliers
if min(g) ~= 0;
    if ~isempty(find(abs(min(g)-g)/min(g) > var.nug_discard))
        in = find(abs(min(g)-g)/min(g) < var.nug_discard);
        g = g(in); h = h(in);
        fprintf(1, 'Warning: Nugget outlier being removed\n');
    end
end

% Linear fit
p = polyfit(h,g,1);
g_lin = h*p(1) + p(2);
res = g_lin - g;

% Check the trend of the bottom few points
if p(1) >= 0
    nug = p(2);
else
    nug = mean(g);
    fprintf(1,'Warning: Downward slope, using average for nugget.\n');
end

% Ensure the nugget is positive
var.nug = max(nug, var.zero);

out = var;
