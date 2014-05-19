% Quickly makes scatter plot over bering picture
% Thomas Trantow
% 04/03/13

% Close plots and turn on some gcf values just in case they are off
close all;
%set(gcf,'Visible','on');
%set(0,'DefaultFigureVisible','on'); 

% Load data
s = load('bering_bed_fine.dat');
%s = load('~/Desktop/Bering_Stuff/laser_analysis/fall11/f11_filtered_UTM.dat');
%s = load('bering_bed_JPL_v2_on_UTM.dat');
[Lat,Lon] = utm2deg_bering('bering_bed_fine.dat');
%s2 = load('bering_surface_v2_blg.dat');
%s = s1;
%s(:,3)= s2(:,3)-s1(:,3);
% Plot (in various forms)
%plotBering
f = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
Dar = daspect;
hold on
scatter(Lon,Lat,30,s(:,3),'filled')
%scatter(s(:,1),s(:,2),30,s(:,3),'filled');
%colormap([0:.1:1])
title('{\bf September 2011}');
daspect(Dar)
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'surface elevation (m)');
caxis([0 850])
%caxis([min(s(:,3)),max(s(:,3))])
grid on