function out = fit_vario(var)

% Only care about the points up to the sill
in          = find(var.h - var.range < 0);
var.h_fit   = var.h(in);
var.gam_fit = var.gam(in);

for i = 1:length(var.fun)
  var.var_test = var.fun{i};
  if var.a_adjust
    w{i} = fmincon(@(b) MSE(b, var), var.range, [],[],[],[],[var.zero],[]);
  else
    w{i} = var.range;
  end
  err(i) = MSE(w{i}, var);
end

[tmp I] = min(err);
var.vario_model = var.fun{I};
var.w = w{i};

if var.a_adjust
  var.range     = var.w;
end  


err
out = var;
