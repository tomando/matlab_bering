% Plot Countour
% Thomas Trantow
% 03/22/2013

% Load data
C = load('contour_v3_1.dat');
lon = C(:,1);
lat = C(:,2);

% plot
plotBering
hold on
plot(lon,lat)
xlabel('Longitude')
ylabel('Latitude')
title('Bering-Bagley Footprint')