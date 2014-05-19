% Plot errors
% Thomas Trantow
% 07/11/13
close all
clear all
wantsave = 1; % 1 if you want plots saved

s1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_tot_G_alt/05_2011_10_2011_on_f.dat_error.dat');
%s2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_b_tot_G_alt/11_2011_04_2012_b_on_f.dat_error.dat');
s2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_tot_G_alt/s2_tot_G_alt.dtm_full_weights.dtm_error.dat');
s3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_tot_G_alt/05_2012_10_2012_on_f.dat_error.dat');
s4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_tot_G_alt/11_2012_05_2013_on_f.dat_error.dat');

% s1 = load('~/Desktop/output_data2/05_2011_10_2011_on_f.dat_error.dat');
% s2 = load('~/Desktop/output_data2/11_2011_04_2012_b_on_f.dat_error.dat');
% s3 = load('~/Desktop/output_data2/05_2012_10_2012_on_f.dat_error.dat');
% s4 = load('~/Desktop/output_data2/11_2012_05_2013_on_f.dat_error.dat');
[Lat_s1,Lon_s1] = utm2deg_bering(s1);
[Lat_s2,Lon_s2] = utm2deg_bering(s2);
[Lat_s3,Lon_s3] = utm2deg_bering(s3);
[Lat_s4,Lon_s4] = utm2deg_bering(s4);
o1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_tot_G_alt/05_2011_10_2011_on_f.dat_sigma.dat');
%o2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_b_tot_G_alt/11_2011_04_2012_b_on_f.dat_sigma.dat');
o2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_tot_G_alt/s2_tot_G_alt.dtm_full_weights.dtm_sigma.dat');
o3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_tot_G_alt/05_2012_10_2012_on_f.dat_sigma.dat');
o4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_tot_G_alt/11_2012_05_2013_on_f.dat_sigma.dat');

% o1 = load('~/Desktop/output_data2/05_2011_10_2011_on_f.dat_sigma.dat');
% o2 = load('~/Desktop/output_data2/11_2011_04_2012_b_on_f.dat_sigma.dat');
% o3 = load('~/Desktop/output_data2/05_2012_10_2012_on_f.dat_sigma.dat');
% o4 = load('~/Desktop/output_data2/11_2012_05_2013_on_f.dat_sigma.dat');

[Lat_o1,Lon_o1] = utm2deg_bering(o1);
[Lat_o2,Lon_o2] = utm2deg_bering(o2);
[Lat_o3,Lon_o3] = utm2deg_bering(o3);
[Lat_o4,Lon_o4] = utm2deg_bering(o4);
d1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_tot_G_alt/05_2011_10_2011_on_f.dat_delta.dat');
%d2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_b_tot_G_alt/11_2011_04_2012_b_on_f.dat_delta.dat');
d2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_tot_G_alt/s2_tot_G_alt.dtm_full_weights.dtm_delta.dat');
d3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_tot_G_alt/05_2012_10_2012_on_f.dat_delta.dat');
d4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_tot_G_alt/11_2012_05_2013_on_f.dat_delta.dat');

% d1 = load('~/Desktop/output_data2/05_2011_10_2011_on_f.dat_delta.dat');
% d2 = load('~/Desktop/output_data2/11_2011_04_2012_b_on_f.dat_delta.dat');
% d3 = load('~/Desktop/output_data2/05_2012_10_2012_on_f.dat_delta.dat');
% d4 = load('~/Desktop/output_data2/11_2012_05_2013_on_f.dat_delta.dat');

[Lat_d1,Lon_d1] = utm2deg_bering(d1);
[Lat_d2,Lon_d2] = utm2deg_bering(d2);
[Lat_d3,Lon_d3] = utm2deg_bering(d3);
[Lat_d4,Lon_d4] = utm2deg_bering(d4);

n1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_tot_G_alt/05_2011_10_2011_on_f.dat_nugget.dat');
n2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_b_tot_G_alt/11_2011_04_2012_b_on_f.dat_nugget.dat');
%n2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_tot_G_alt/s2_tot_G_alt.dtm_full_weights.dtm_nugget.dat');
n3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_tot_G_alt/05_2012_10_2012_on_f.dat_nugget.dat');
n4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_tot_G_alt/11_2012_05_2013_on_f.dat_nugget.dat');
% n1 = load('~/Desktop/output_data2/05_2011_10_2011_on_f.dat_nugget.dat');
% n2 = load('~/Desktop/output_data2/11_2011_04_2012_b_on_f.dat_nugget.dat');
% n3 = load('~/Desktop/output_data2/05_2012_10_2012_on_f.dat_nugget.dat');
% n4 = load('~/Desktop/output_data2/11_2012_05_2013_on_f.dat_nugget.dat');


[Lat_n1,Lon_n1] = utm2deg_bering(n1);
[Lat_n2,Lon_n2] = utm2deg_bering(n2);
[Lat_n3,Lon_n3] = utm2deg_bering(n3);
[Lat_n4,Lon_n4] = utm2deg_bering(n4);

% Size max and min of error in data sets
disp('Size of error levels (s1): ');
disp(size(s1))
disp('Max error level (s1): ')
disp(max(s1(:,3)))
disp('Min error level (s1): ')
disp(min(s1(:,3)))
disp('Mean error level (s1)');
disp(mean(s1(:,3)));

disp('Size of error levels (s2): ');
disp(size(s2))
disp('Max error level (s2): ')
disp(max(s2(:,3)))
disp('Min error level (s2): ')
disp(min(s2(:,3)))
disp('Mean error level (s2)');
disp(mean(s2(:,3)));

disp('Size of error levels (s3): ');
disp(size(s3))
disp('Max error level (s3): ')
disp(max(s3(:,3)))
disp('Min error level (s3): ')
disp(min(s3(:,3)))
disp('Mean error level (s3)');
disp(mean(s3(:,3)));

disp('Size of error levels (s4): ');
disp(size(s4))
disp('Max error level (s4): ')
disp(max(s4(:,3)))
disp('Min error level (s4): ')
disp(min(s4(:,3)))
disp('Mean error level (s4)');
disp(mean(s4(:,3)));

s = cat(1,s1(:,3), s2(:,3), s3(:,3), s4(:,3));
disp('Size of error levels (all): ');
disp(size(s))
disp('Max error level (all): ')
disp(max(s))
disp('Min error level (all): ')
disp(min(s))
disp('Mean error level (all)');
disp(mean(s));


% Size max and min of noise in data sets
disp('Size of noise levels (s1): ');
disp(size(o1))
disp('Max noise level (s1): ')
disp(max(o1(:,3)))
disp('Min noise level (s1): ')
disp(min(o1(:,3)))
disp('Mean noise level (s1)');
disp(mean(o1(:,3)));

disp('Size of noise levels (s2): ');
disp(size(o2))
disp('Max noise level (s2): ')
disp(max(o2(:,3)))
disp('Min noise level (s2): ')
disp(min(o2(:,3)))
disp('Mean noise level (s2)');
disp(mean(o2(:,3)));

disp('Size of noise levels (s3): ');
disp(size(o3))
disp('Max noise level (s3): ')
disp(max(o3(:,3)))
disp('Min noise level (s3): ')
disp(min(o3(:,3)))
disp('Mean noise level (s3)');
disp(mean(o3(:,3)));

disp('Size of noise levels (s4): ');
disp(size(o4))
disp('Max noise level (s4): ')
disp(max(o4(:,3)))
disp('Min noise level (s4): ')
disp(min(o4(:,3)))
disp('Mean noise level (s4)');
disp(mean(o4(:,3)));

o = cat(1,o1(:,3), o2(:,3), o3(:,3), o4(:,3));
disp('Size of noise levels (all): ');
disp(size(o))
disp('Max noise level (all): ')
disp(max(o))
disp('Min noise level (all): ')
disp(min(o))
disp('Mean noise level (all)');
disp(mean(o));

% Size max and min of nugget values in data sets
disp('Size of nugget levels (s1): ');
disp(size(n1))
disp('Max nugget level (s1): ')
disp(max(n1(:,3)))
disp('Min nugget level (s1): ')
disp(min(n1(:,3)))
disp('Mean nugget level (s1)');
disp(mean(n1(:,3)));

disp('Size of nugget levels (s2): ');
disp(size(n2))
disp('Max nugget level (s2): ')
disp(max(n2(:,3)))
disp('Min nugget level (s2): ')
disp(min(n2(:,3)))
disp('Mean nugget level (s2)');
disp(mean(n2(:,3)));

disp('Size of nugget levels (s3): ');
disp(size(n3));
disp('Max nugget level (s3): ')
disp(max(n3(:,3)));
disp('Min nugget level (s3): ')
disp(min(n3(:,3)));
disp('Mean nugget level (s3)');
disp(mean(n3(:,3)));

disp('Size of nugget levels (s4): ');
disp(size(n4));
disp('Max nugget level (s4): ')
disp(max(n4(:,3)));
disp('Min nugget level (s4): ')
disp(min(n4(:,3)));
disp('Mean nugget level (s4)');
disp(mean(n4(:,3)));

n = cat(1,s1(:,3), n2(:,3), n3(:,3), n4(:,3));
disp('Size of nugget levels (all): ');
disp(size(n));
disp('Max nugget level (all): ')
disp(max(n));
disp('Min nugget level (all): ')
disp(min(n));
disp('Mean nugget level (all)');
disp(mean(n));


fig1 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s1,Lat_s1,30,s1(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 12]);
%caxis([min(s1(:,3)) max(s1(:,3))]);
ylabel(h,'error (m)','FontSize',20);
title('Error in summer 2011 data','FontWeight','bold');
grid on

fig2 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s2,Lat_s2,30,s2(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 12]);
%caxis([min(s2(:,3)) max(s2(:,3))]);
ylabel(h,'error (m)','FontSize',20);
title('Error in winter 2011/2012 data','FontWeight','bold');
grid on

fig3 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s3,Lat_s3,30,s3(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 12]);
%caxis([min(s3(:,3)) max(s3(:,3))]);
ylabel(h,'error (m)','FontSize',20);
title('Error in summer 2012 data','FontWeight','bold');
grid on

fig4 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s4,Lat_s4,30,s4(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 12]);
%caxis([min(s4(:,3)) max(s4(:,3))]);
ylabel(h,'error (m)','FontSize',20);
title('Error in winter 2012/2013 data','FontWeight','bold');
grid on

fig5 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_o1,Lat_o1,30,o1(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 20]);
%caxis([min(o1(:,3)) max(o1(:,3))]);
ylabel(h,'noise level (m)','FontSize',20);
title('Noise level for summer 2011 data','FontWeight','bold');
grid on

fig6 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_o2,Lat_o2,30,o2(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 20]);
%caxis([min(o2(:,3)) max(o2(:,3))]);
ylabel(h,'noise level (m)','FontSize',20);
title('Noise level for winter 2011/2012 data','FontWeight','bold');
grid on

fig7 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_o3,Lat_o3,30,o3(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 20]);
%caxis([min(o3(:,3)) max(o3(:,3))]);
ylabel(h,'noise level (m)','FontSize',20);
title('Noise level for summer 2012 data','FontWeight','bold');
grid on

fig8 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_o4,Lat_o4,30,o4(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 20]);
%caxis([min(o4(:,3)) max(o4(:,3))]);
ylabel(h,'noise level (m)','FontSize',20);
title('Noise level for winter 2012/2013 data','FontWeight','bold');
grid on

fig9 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_d1,Lat_d1,30,d1(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 90]);
%caxis([min(d1(:,3)) max(d1(:,3))]);
ylabel(h,'delta value (m)','FontSize',20);
title('Delta value for summer 2011 data','FontWeight','bold');
grid on

fig10 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_d2,Lat_d2,30,d2(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 90]);
%caxis([min(d2(:,3)) max(d2(:,3))]);
ylabel(h,'delta value (m)','FontSize',20);
title('Delta value for winter 2011/2012 data','FontWeight','bold');
grid on

fig11 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_d3,Lat_d3,30,d3(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 90]);
%caxis([min(d3(:,3)) max(d3(:,3))]);
ylabel(h,'delta value (m)','FontSize',20);
title('Delta value for summer 2012 data','FontWeight','bold');
grid on

fig12 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_d4,Lat_d4,30,d4(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 90]);
%caxis([min(d4(:,3)) max(d4(:,3))]);
ylabel(h,'delta value (m)','FontSize',20);
title('Delta value for winter 2012/2013 data','FontWeight','bold');
grid on

fig13 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_n1,Lat_n1,30,n1(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 1000]);
%caxis([min(n1(:,3)) max(n1(:,3))]);
ylabel(h,'nugget value (m\^2)','FontSize',20);
title('Nugget values for summer 2011 data','FontWeight','bold');
grid on

fig14 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_n2,Lat_n2,30,n2(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 1000]);
%caxis([min(n2(:,3)) max(n2(:,3))]);
ylabel(h,'nugget value (m\^2)','FontSize',20);
title('Nugget values for winter 2011/2012 data','FontWeight','bold');
grid on

fig15 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_n3,Lat_n3,30,n3(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 1000]);
%caxis([min(n3(:,3)) max(n3(:,3))]);
ylabel(h,'nugget value (m\^2)','FontSize',20);
title('Nugget values for summer 2012 data','FontWeight','bold');
grid on

fig16 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_n4,Lat_n4,30,n4(:,3),'filled');
daspect(DAR);
colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
caxis([0 1000]);
%caxis([min(n4(:,3)) max(n4(:,3))]);
ylabel(h,'nugget value (m\^2)','FontSize',20);
title('Nugget values for winter 2012/2013 data','FontWeight','bold');
grid on
if wantsave ==1
    saveas(fig1,strcat('~/Desktop/Plots/error_s1.jpg'));
    saveas(fig2,strcat('~/Desktop/Plots/error_s2.jpg'));
    saveas(fig3,strcat('~/Desktop/Plots/error_s3.jpg'));
    saveas(fig4,strcat('~/Desktop/Plots/error_s4.jpg'));
    saveas(fig5,strcat('~/Desktop/Plots/sigma_s1.jpg'));
    saveas(fig6,strcat('~/Desktop/Plots/sigma_s2.jpg'));
    saveas(fig7,strcat('~/Desktop/Plots/sigma_s3.jpg'));
    saveas(fig8,strcat('~/Desktop/Plots/sigma_s4.jpg'));
    saveas(fig9,strcat('~/Desktop/Plots/delta_s1.jpg'));
    saveas(fig10,strcat('~/Desktop/Plots/delta_s2.jpg'));
    saveas(fig11,strcat('~/Desktop/Plots/delta_s3.jpg'));
    saveas(fig12,strcat('~/Desktop/Plots/delta_s4.jpg'));  
    saveas(fig13,strcat('~/Desktop/Plots/nugget_s1.jpg'));
    saveas(fig14,strcat('~/Desktop/Plots/nugget_s2_b.jpg'));
    saveas(fig15,strcat('~/Desktop/Plots/nugget_s3.jpg'));
    saveas(fig16,strcat('~/Desktop/Plots/nugget_s4.jpg')); 
end
