clear all; clc; close all;

%%%%%%%%%%%%%%%%%%%%% Real Data %%%%%%%%%%%%%%%%%%%%
var.h_bin = 2;
data      = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/Variograms_b/variotot.dat');
%data = load('variotot.dat');
%data      = load('var_data/beaufort.awk.82-85.2m.totvar');
%data      = load('var_data/chukchi.awk.mod2.12-15.2m.totvar');
%data      = load('var_data/elson.awk.14-35.2m.totvar');
%data      = load('var_data/elson.awk.35-46.2m.totvar');
%data      = load('var_data/elson.awk.46-52.2m.totvar');
%data      = load('var_data/elson.awk.52-62.2m.totvar');
%data      = load('var_data/elson.awk.62-74.2m.totvar');

var.h     = data(:,2);
var.gam   = data(:,4);

var       = vario(var)
figure;
var_plot(var);

