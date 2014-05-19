% Quickly makes scatter plot over bering picture
% Thomas Trantow
% 04/03/13


function beringScatter(dataFile,type,B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%       dataFile - String; name of file
%       type     - 1 if UTM, 2 if Lat/Lon
%       B        - 1 if Bering, 2 if Bering/Bagley
%
% Output:
%       A scatter plot
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Close plots and turn on some gcf values just in case they are off
close all;

% Load data
s = load(dataFile);
if (type == 1)
    [Lat,Lon] = utm2deg_bering(dataFile);
else
    Lon = s(:,1);
    Lat = s(:,2);
end


f = figure('Position', [100, 100, 800, 450]);
% Plot (in various forms)
if (B ==1)
    plotBering
else
    plotBBGS
end

set(gca,'FontSize',15);

Dar = daspect;
hold on
scatter(Lon,Lat,30,s(:,3),'filled')
%scatter(s(:,1),s(:,2),30,s(:,3),'filled');
%colormap([0:.1:1])
%title('{\bf May 2011 to April 2013}');
daspect(Dar)
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'elevation (m)');
%caxis([-400 400])
caxis([min(s(:,3)),max(s(:,3))])
grid on
%J = load('bering_surf_JPL_v2.dat');
%scatter(J(:,1),J(:,2),30,J(:,3),'filled');
end