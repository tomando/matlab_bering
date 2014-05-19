function var = gen_vario(h,var_fun,noise)

  var = var_fun(h)' + noise*randn(size(h));
