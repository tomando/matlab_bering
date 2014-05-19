% Thomas Trantow
% Bering Bagley surface data
% 09/19/2013

close all
clear all
clc

wantsave =1;

% From cryosat
C = load('bering_bagley_filtered_on.dat');
[LatC,LonC] = utm2deg_bering([C(:,1),C(:,2)]);
D = [LonC, LatC, C(:,3)];
% From JPL
J = load('bering_surf_JPL_v2.dat');

% Combined
T = [D;J];

fig2 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBBGS
DAR = daspect;
hold on
scatter(T(:,1),T(:,2),30,T(:,3),'filled')
daspect(DAR);
h=colorbar;
set(h,'fontsize',20);
caxis([min(T(:,3)) 1200]);
ylabel(h,'surface elevation (m)','FontSize',20);
title('Surface Elevation from Cryosat2 and JPL 01/2012','FontWeight','bold');
grid on

if(wantsave ==1)
    dlmwrite('cryosat_JPL_surf.dat',T,'delimiter',' ','precision',14);
end