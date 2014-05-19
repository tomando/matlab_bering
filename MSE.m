function error = MSE(w,var)

% Check if the first point is an outlier
if (var.gam(1) - var.nug)/var.nug > var.nug_discard
    s = 2;
else
    s = 1;
end

a = var.range;
c0 = var.nug;
c1 = var.sill-c0;

gam_test = var.var_test(a, c0, c1, var.h_fit(s:end), w);
gam_test = gam_test';
error = 1/length(var.gam_fit) * sum((gam_test - var.gam_fit(s:end)).^2);
