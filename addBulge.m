% Filename: addBulge.m
% Author: Thomas Trantow
% Data: 06/05/2013
% Description: Add a bulge to an existing DEM           
%
% Input:
%         filename  - name of data file  (use quotes and UTM):
%                     (x,y,elev)
%         h         - height of bulge
%                    
% Output:
%         filename_blg.dat
%
%-------------------------------------------------------------------------

function addBulge(filename,h)
close all
F = load(filename);
X = F(:,1);
Y = F(:,2);
ELEV = F(:,3);
len = length(X);
ELEV_blg = ELEV;

% square bulge
% Add at the upper part of the glacier
%B = [408000 6707500;413000 6705766;418000 6708533; 413700 6709767];
% Add midway down the glacier
B = [382400 6697000;382400 6694000;389600 6694000; 389600 6697000];

XV = B(:,1);
YV = B(:,2);


IN = inpolygon(X,Y,XV,YV);

for j = 1:len
    if IN(j) == 1
        ELEV_blg(j) = ELEV_blg(j) + h;
    end
end

Data = [X,Y,ELEV_blg];

w = filename(end-3:end);
name = strrep(filename,w,'_blg.dat');
dlmwrite(name,Data,'delimiter',' ','precision',14)  

scatter(X,Y,30,ELEV_blg,'filled')
h = colorbar;
ylabel(h, 'surface elevation (m)');
caxis([ceil(min(ELEV_blg)) 1250]);

C = load('contour_v4_1_UTM.dat');
hold on
plot(C(:,1),C(:,2),'k','LineWidth', 3)
end