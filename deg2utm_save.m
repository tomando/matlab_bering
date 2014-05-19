% Deg 2 utm and save data in a data file

str = 'usgs_bed_on';
D = load(strcat(str,'.dat'));

[F1,F2] = deg2utm(D(:,2),D(:,1));

Data = [F1,F2,D(:,3)];

dlmwrite(strcat(str,'_UTM.dat'),Data,'delimiter',' ','precision',14)