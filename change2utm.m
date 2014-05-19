% Change into UTM

D = load('contour_v3_1.dat');
Lat = D(:,2);
Lon = D(:,1);
%Elev = D(:,3);

[X,Y,zone] = deg2utm_07V(Lat,Lon);

Data = [X Y];
% Data = [X Y Elev];

dlmwrite('contour_v3_1_UTM.dat',Data,' ');