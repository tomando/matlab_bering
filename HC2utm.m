% Change into UTM

D = load('bering_bed_on.dat');
Lat = D(:,2);
Lon = D(:,1);
Elev = D(:,3);

[X,Y,zone] = deg2utm(Lat,Lon);

Data = [X Y Elev];

dlmwrite('bering_bed_UTM.dat',Data,'delimiter',' ','precision',14);