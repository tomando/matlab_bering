% Thomas Trantow
% JPL Bering Thicknesws Manipulation
% 09/09/13
close all
clear all
wantdatafile = 1;

% Load in data
D = load('bering_bed_2.dat');
Lon = D(:,1);
Lat = D(:,2);
thick = D(:,3);
surf_alt = D(:,4);
aircr_alt = D(:,5);

N = length(Lon);% number of measurements

% many measurents of thickness are unavalible and are in the data file as
% -9999, so here we take those out and use only the good, measured data

counter =0;

for i = 1:N
    if thick(i) ~= -9999
        counter = counter +1;
        bed(counter) = surf_alt(i) - thick(i);
        Data(counter,:) = [Lon(i),Lat(i),thick(i),surf_alt(i),aircr_alt(i),bed(counter)];
    end
end

%BED = [Data(:,1),Data(:,2),Data(:,6)];
SURF = [Data(:,1),Data(:,2),Data(:,4)];
% Howard conway bed data

%HC = load('bering.zbed');
%BED = [bed_data;HC];

% fig1 = figure('Position', [100, 100, 800, 450]);
% set(gca,'FontSize',15);
% plotBering
% DAR = daspect;
% hold on
% scatter(BED(:,1),BED(:,2),30,BED(:,3),'filled')
% daspect(DAR);
% h=colorbar;
% set(h,'fontsize',20);
% caxis([min(bed) max(bed)]);
% ylabel(h,'bed elevation (m)','FontSize',20);
% title('Bed Elevation from JPL 01/2012','FontWeight','bold');
% grid on

fig2 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
plotBering
DAR = daspect;
hold on
scatter(SURF(:,1),SURF(:,2),30,SURF(:,3),'filled')
daspect(DAR);
h=colorbar;
set(h,'fontsize',20);
caxis([min(surf_alt) max(surf_alt)]);
ylabel(h,'surface elevation (m)','FontSize',20);
title('Surface Elevation from JPL 01/2012','FontWeight','bold');
grid on


if(wantdatafile ==1)
    %dlmwrite('bering_bed_JPL_v2.dat',BED,'delimiter',' ','precision',14);
    dlmwrite('bering_surf_JPL_v2.dat',SURF,'delimiter',' ','precision',14);   
end





