% Plot stadard deviations of kriging results (.est files)

close all
clear all
clc

wantsave = 1; % 1 if you want plots saved

s1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_G_fixed/s1_G_fixed_est_on.dat');
s2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_G_fixed/s2_G_fixed_est_on.dat');
s3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_G_fixed/s3_G_fixed_est_on.dat');
s4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_G_fixed/s4_G_fixed_est_on.dat');

[Lat_s1,Lon_s1] = utm2deg_bering(s1);
[Lat_s2,Lon_s2] = utm2deg_bering(s2);
[Lat_s3,Lon_s3] = utm2deg_bering(s3);
[Lat_s4,Lon_s4] = utm2deg_bering(s4);
% non-dimensionalize
% l = length(s1);
% x1 = zeros(l,1);
% x2 = zeros(l,1);
% x3 = zeros(l,1);
% x4 = zeros(l,1);
% min1 = min(s1(:,3));
% max1 = max(s1(:,3));
% min2 = min(s2(:,3));
% max2 = max(s2(:,3));
% min3 = min(s3(:,3));
% max3 = max(s3(:,3));
% min4 = min(s4(:,3));
% max4 = max(s4(:,3));
% 
% for i = 1:l
%     x1(i) = (s1(i,3)-min1)/(max1-min1);
%     x2(i) = (s2(i,3)-min2)/(max2-min2);
%     x3(i) = (s3(i,3)-min3)/(max3-min3);
%     x4(i) = (s4(i,3)-min4)/(max4-min4);
% end

fig1 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s1,Lat_s1,30,s1(:,3),'filled')
%scatter(s1(:,1),s1(:,2),30,x1,'filled')
daspect(DAR);
%colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
%caxis([min(s1(:,3)) max(s1(:,3))]);
caxis([0 50])
%caxis([0 1])
ylabel(h,'standard deviation (m)','FontSize',20);
title('Standard deviation summer 2011','FontWeight','bold');
grid on

fig2 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s2,Lat_s2,30,s2(:,3),'filled')
%scatter(s2(:,1),s2(:,2),30,x2,'filled')
daspect(DAR);
%colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
%caxis([min(s2(:,3)) max(s2(:,3))])
caxis([0 50])
%caxis([0 1])
ylabel(h,'standard deviation (m)','FontSize',20);
title('Standard deviation winter 2011/2012','FontWeight','bold');
grid on

fig3 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s3,Lat_s3,30,s3(:,3),'filled')
%scatter(s3(:,1),s3(:,2),30,x3,'filled')
daspect(DAR);
%colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
%caxis([min(s3(:,3)) max(s3(:,3))])
caxis([0 50])
%caxis([0 1])
ylabel(h,'standard deviation (m)','FontSize',20);
title('Standard deviation summer 2012','FontWeight','bold');
grid on

fig4 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(Lon_s4,Lat_s4,30,s4(:,3),'filled')
%scatter(s4(:,1),s4(:,2),30,x4,'filled')
daspect(DAR);
%colormap('Cool')
h = colorbar;
set(h,'fontsize',20);
%caxis([min(s4(:,3)) max(s4(:,3))])
caxis([0 50])
%caxis([0 1])
ylabel(h,'standard deviation (m)','FontSize',20);
title('Standard deviation winter 2012/2013','FontWeight','bold');
grid on


if wantsave ==1
    saveas(fig1,strcat('~/Desktop/Plots/stddev_s1.jpg'));
    saveas(fig2,strcat('~/Desktop/Plots/stddev_s2.jpg'));
    saveas(fig3,strcat('~/Desktop/Plots/stddev_s3.jpg'));
    saveas(fig4,strcat('~/Desktop/Plots/stddev_s4.jpg'));  
end
