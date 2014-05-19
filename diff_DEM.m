% Differences in Digital Elevation Models

close all

wantsaveplots = 0; %1 if you want to save the plots
wantsavefiles = 1;

s1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_G_fixed/s1_G_fixed_on.dat');
s2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_G_fixed/s2_G_fixed_on.dat');
s3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_G_fixed/s3_G_fixed_on.dat');
s4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_G_fixed/s4_G_fixed_on.dat');
[Lat1,Lon1] = utm2deg_bering('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_G_fixed/s1_G_fixed_on.dat');
[Lat2,Lon2] = utm2deg_bering('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_G_fixed/s2_G_fixed_on.dat');
[Lat3,Lon3] = utm2deg_bering('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_G_fixed/s3_G_fixed_on.dat');
[Lat4,Lon4] = utm2deg_bering('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_G_fixed/s4_G_fixed_on.dat');



%s1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_tot_G_alt/s2_tot_G_alt_on.dat');
%s2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_b_tot_G_alt/s2_b_tot_G_alt_on.dat');
%[Lat1,Lon1] = utm2deg_bering('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_tot_G_alt/s2_tot_G_alt_on.dat');
%[Lat2,Lon2] = utm2deg_bering('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_b_tot_G_alt/s2_b_tot_G_alt_on.dat');
%s1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/krg_s1_tot_matlab/krg_matlab_s1_on.dat');
%s2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/krg_s2_tot_matlab/krg_matlab_s2_on.dat');
%s3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/krg_s3_tot_matlab/krg_matlab_s3_on.dat');
%s4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/krg_s4_tot_matlab/krg_matlab_s4_on.dat');

    
diff1 = s2(:,3) - s1(:,3);
diff2 = s3(:,3) - s2(:,3);
diff3 = s4(:,3) - s3(:,3);
diff4 = s4(:,3) - s2(:,3);
diff5 = s3(:,3) - s1(:,3);
diff6 = s4(:,3) - s1(:,3);



if wantsavefiles == 1
    dlmwrite('diff1.dat',[s1(:,1),s1(:,2),diff1],'delimiter', ' ', 'precision', 10);
    dlmwrite('diff2.dat',[s2(:,1),s2(:,2),diff2],'delimiter', ' ', 'precision', 10);
    dlmwrite('diff3.dat',[s3(:,1),s3(:,2),diff3],'delimiter', ' ', 'precision', 10);
    dlmwrite('diff4.dat',[s4(:,1),s4(:,2),diff4],'delimiter', ' ', 'precision', 10);
    dlmwrite('diff5.dat',[s4(:,1),s4(:,2),diff5],'delimiter', ' ', 'precision', 10);
    dlmwrite('diff6.dat',[s4(:,1),s4(:,2),diff6],'delimiter', ' ', 'precision', 10);
    
end

if wantsaveplots ==1
    
fig1 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
%scatter(s1(:,1),s1(:,2),30,diff1,'filled')
scatter(Lon1,Lat1,30,diff1,'filled')
daspect(DAR);
H = colormap(b2r(min(diff1),max(diff1)));
h = colorbar;
set(h,'fontsize',20);
caxis([-100 150]);
ylabel(h,'change in elevation (m)','FontSize',20);
%title('Difference between Gaussian fits');
title('Change from summer 2011 to winter 2011/2012','FontWeight','bold');
grid on

fig2 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
%scatter(s2(:,1),s2(:,2),30,diff2,'filled')
scatter(Lon2,Lat2,30,diff2,'filled')
daspect(DAR);
H = colormap(b2r(min(diff2),max(diff2)));
h=colorbar;
set(h,'fontsize',20);
caxis([-75 50]);
ylabel(h,'change in elevation (m)','FontSize',20);
title('Change from winter 2011/2012 to summer 2012','FontWeight','bold');
grid on

fig3 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
%scatter(s3(:,1),s3(:,2),30,diff3,'filled')
scatter(Lon3,Lat3,30,diff3,'filled')
daspect(DAR);
H = colormap(b2r(min(diff3),max(diff3)));
h = colorbar;
set(h,'fontsize',20);
caxis([-50 50]);
ylabel(h,'change in elevation (m)','FontSize',20);
title('Change from summer 2012 to winter 2012/2013','FontWeight','bold');
grid on

fig4 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
%scatter(s4(:,1),s4(:,2),30,diff4,'filled')
scatter(Lon4,Lat4,30,diff4,'filled')
daspect(DAR);
H = colormap(b2r(min(diff4),max(diff4)));
h = colorbar;
set(h,'fontsize',20);
caxis([-50 50]);
ylabel(h,'change in elevation (m)','FontSize',20);
title('Change from winter 2011/2012 to winter 2012/2013','FontWeight','bold');
grid on

fig5 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
daspect(DAR);
hold on
%scatter(s3(:,1),s3(:,2),30,diff5,'filled')
scatter(Lon3,Lat3,30,diff5,'filled')
H = colormap(b2r(min(diff5),max(diff5)));
h = colorbar;
set(h,'fontsize',20);
caxis([-75 100]);
ylabel(h,'change in elevation (m)','FontSize',20);
title('Change from summer 2011 to summer 2012','FontWeight','bold');
grid on

fig6 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
daspect(DAR);
hold on
%scatter(s4(:,1),s4(:,2),30,diff6,'filled')
scatter(Lon4,Lat4,30,diff6,'filled')
H = colormap(b2r(min(diff6),max(diff6)));
h = colorbar;
set(h,'fontsize',20);
caxis([-100 100]);
ylabel(h,'change in elevation (m)','FontSize',20);
title('Change from summer 2011 to winter 2012/2013','FontWeight','bold');
grid on


    saveas(fig1,strcat('~/Desktop/Plots/diff1.jpg'));
    saveas(fig2,strcat('~/Desktop/Plots/diff2.jpg'));
    saveas(fig3,strcat('~/Desktop/Plots/diff3.jpg'));
    saveas(fig4,strcat('~/Desktop/Plots/diff4.jpg'));
    saveas(fig5,strcat('~/Desktop/Plots/diff5.jpg'));
    saveas(fig6,strcat('~/Desktop/Plots/diff6.jpg')); 
end

