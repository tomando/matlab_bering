% Filename: dataOnGlacier.m
% Author: Thomas Trantow
% Data: 04/04/2013
% Description: Gets data on the Bering-Bagley System; gets the data points
%              inside the glacier footprint given by contour
%
% Input:
%         filename  - name of data file  (use quotes): (lat,lon,elev) or
%                     (x,y,elev)
%         wantplot  - 1 if you want a plot to be generated
%         writedata - 1 if you want an output file of the data on the
%                     glacier
%         type      - 1 if in UTM, 2 if in Lat Lon
%         outside   - 1 if you want no values outside glacier, input number
%                     'outside' for that value to be entered for data
%                     outside the glacier
% Output:
%         Data            - Data that is on the glacier
%         filename_on.dat - if you writedata=1 this is the output file
%
%-------------------------------------------------------------------------
function dataOnGlacier(filename, wantplot, writedata, type, outside)

close all
set(gcf,'Visible','on');
set(0,'DefaultFigureVisible','on');
%Bering-Bagley
%C = load('data/contour_bagley_v1.dat');
% Just Bering
C = load('data/contour_v6_1.dat');
Lon = C(:,1);
Lat = C(:,2);

D = load(filename);

% Determine the season if applicable
season = filename(1:2);
if strcmp(season,'s1')
    str1 = 'May 2011 to October 2011';
elseif strcmp(season,'s2')
    str1 = 'November 2011 to April 2012';
elseif strcmp(season,'s3')
    str1 = 'May 2012 to October 2012';
elseif strcmp(season,'s4')
    str1 = 'November 2012 to April 2013';
else
    str1 = '';
end
%if in UTM
if (type ==1)
    [XV,YV,zone] = deg2utm_07V(Lat,Lon);
elseif (type ==2)
    XV = Lon;
    YV = Lat;
end

X = D(:,1);
Y = D(:,2);
ELEV = D(:,3);

% Matrix IN: 1 if in or on glacier, 0 otherwise
IN = inpolygon(X,Y,XV,YV);

if (outside ==1)
    
    % Number of Data Points on Glacier
    num = sum(IN);
    
    % Matrix containing elevation only if it is on the glacier
    X_IN = zeros(num,1);
    Y_IN = zeros(num,1);
    ELEV_IN = zeros(num,1);
    counter = 1;
    
    for i = 1:length(ELEV)
        if IN(i) == 1
            X_IN(counter) = X(i);
            Y_IN(counter) = Y(i);
            ELEV_IN(counter) = ELEV(i);
            counter = counter+1;
        end
    end

else
    len = length(ELEV);
    X_IN = zeros(len,1);
    Y_IN = zeros(len,1);
    ELEV_IN = zeros(len,1);
    for i = 1:len
        if IN(i) == 1
            X_IN(i) = X(i);
            Y_IN(i) = Y(i);
            ELEV_IN(i) = ELEV(i);
        else
            X_IN(i) = X(i);
            Y_IN(i) = Y(i);
            ELEV_IN(i) = outside;
        end
    end
end
% Plot
if wantplot ==1
    if type==1
        fig1 = figure('Position', [100, 100, 800, 450]);
        plotBering
        %plotBBGS
        DAR = daspect;
        set(gca,'FontSize',15);
        %For better plotting use lat/lon
        [Y_IN,X_IN] = utm2deg_bering([X_IN,Y_IN]);
    elseif type == 2
        fig1 = figure('Position', [100, 100, 800, 450]);
        plotBering
        %plotBBGS
        grid on
        DAR = daspect;
        set(gca,'FontSize',15);
    end
    hold on
    scatter(X_IN,Y_IN,25,ELEV_IN,'filled')
    disp('p')
    grid on
    daspect(DAR);
    h = colorbar;
    set(h,'fontsize',20);
    title(str1,'FontWeight','bold')
    
    if (type ==1)
        ylabel(h, 'elevation (m)','FontSize',20);
        caxis([0 1200]);
        %caxis([ceil(min(ELEV_IN)) ceil(max(ELEV_IN))]);
        %caxis([-350 400]);
        %caxis([-350 400])
        %caxis([0 2000]);
    elseif (type ==2)
        ylabel(h,'elevation (m)','FontSize',20);
    end
end

Data = [X_IN,Y_IN,ELEV_IN];

% Write data to file
if writedata == 1
    w = filename(end-3:end);
    name = strrep(filename,w,'_on.dat');
    dlmwrite(name,Data,'delimiter',' ','precision',14) 
end


end