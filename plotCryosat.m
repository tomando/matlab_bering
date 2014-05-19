% Plot Cryosat Data
% Thomas Trantow
% 03/14/13

close all

% Get data and assign to variables
C = load('beringcryosat_12.dat');
X = C(:,1);
Y = C(:,2);
Elev = C(:,3);

% Plot Bering photo and cryosat data
plotBeringUTM
hold on
scatter(X,Y,10,Elev)
% Scatter plot options
h = colorbar;
ylabel(h, 'surface elevation (m)');
caxis([0 3500]);