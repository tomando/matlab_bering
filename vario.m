function out = vario(var)

% This function computes the variogram. As a minimum the input struct
% var must contain the fields <h, gam, data>. Also, any of the values
% can be set and the program will skip computing them.

if ~isfield(var, 'gam')
    var.gam = exp_vario(var.data, var.h, var.h_bin);
    fprintf(1, 'Computation of Experimental Variogram Complete\n');
end

if ~isfield(var, 'tol')
    var.tol = 0.15;
end

if ~isfield(var, 'zero')
    var.zero = 1e-6;
end

if ~isfield(var, 'nug_discard')
    var.nug_discard = 2;
end

if ~isfield(var, 'fun')
    var.fun{1} = @lin_fun;
    var.fun{2} = @gauss_fun;
    var.fun{3} = @sphere_fun;
    var.fun{4} = @exp_fun;
    %var.fun{5} = @erf_fun;
end

if ~isfield(var, 'range')
    var = find_range_sill(var);
    fprintf(1, 'Range and Sill Computation Complete: %f, %f\n',var.range, var.sill);
end

if ~isfield(var, 'nug')
    var = find_nug(var);
    fprintf(1, 'Nugget Computation Complete\n');
end

if ~isfield(var, 'w')
    var.a_adjust = 0; % Set to 1 to adjust the range during function fitting.
    var = fit_vario(var);
    fprintf(1, 'Variogram Fit Complete\n');
end
out = var;
