%% All Bering Data in one M-File %%

%% Flight 1 Fall 2011 Test Data (_1)%%

% Flight 1 GPS

gps_1 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_fall11/2011_09_25_12_08_27.GPS',' ',1,0);

lat_1 = gps_1(:,3);                  % Latitude (North)
lon_1 = -gps_1(:,4);                 % Longitude (West)
alt_1 = gps_1(:,6);                  % Altitude (meters)
tgps_1 = gps_1(:,1);                 % Time (seconds) starts at 1316974108.058663 sec 

% Flight 1 Laser 1 (first time laser was held out)

uls_1 = load('~/Desktop/Bering_Stuff/make_data_products/in_data_fall11/2011_09_25_14_08_42.ULS');     % ULS is the laser data 

tu_1 = uls_1(:,1);                     % Time (seconds), total time used: 550.455 sec
ru_1 = uls_1(:,2) * 0.3048;            % Laser range (changed from feet to meters) 
altu_1 = interp1(tgps_1,alt_1,tu_1);   % Finding altitude by interpolating the gps data at laser times
elev_1 = altu_1 - ru_1;                % Elevation based on gps and laser data
                                       % 
latu_1 = interp1(tgps_1,lat_1,tu_1);   % Latitude interpolated from gps data at laser times 
lonu_1 = interp1(tgps_1,lon_1,tu_1);   % Longitude interpolated from gps data at laser times 
d_1 = dist_track(latu_1, lonu_1);      % 'dist_track' is a function that is also in the folder. 
                                       % It computes the distance along the track.        

                                                                           
% Flight 1 Laser 2 (second time laser was held out)
                             
uls2_1 = load('~/Desktop/Bering_Stuff/make_data_products/in_data_fall11/2011_09_25_14_22_21.ULS');     % ULS is the laser data 

tu2_1 = uls2_1(:,1);                    % Time (seconds), total time used: 1029.423 sec
ru2_1 = uls2_1(:,2) * 0.3048;           % Laser range (changed from feet to meters)
altu2_1 = interp1(tgps_1,alt_1,tu2_1);  % Finding altitude by interpolating the gps data at laser times
elev2_1 = altu2_1 - ru2_1;              % Elevation based on gps and laser data
                                        %
latu2_1 = interp1(tgps_1,lat_1,tu2_1);  % Latitude interpolated from gps data at laser times
lonu2_1 = interp1(tgps_1,lon_1,tu2_1);  % Longitude interpolated from gps data at laser times
d2_1 = dist_track(latu2_1, lonu2_1);    % 'dist_track' is a function that is also in the folder.
                                        % It computes the distance along the track.   
                                        
%% Flight 2 Fall 2011 Test Data (_2) %%

% Flight 2 GPS

gps_2 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_fall11/2011_09_26_15_52_21.GPS',' ',1,0);

lat_2 = gps_2(:,3);                  % latitude (North)
lon_2 = -gps_2(:,4);                 % longitude (West)
alt_2 = gps_2(:,6);                  % altitude (meters)
tgps_2 = gps_2(:,1);                 % Time (seconds) starts at 1317073942.492387 sec  

% Flight 2 Laser 1 (first time laser was held out)

uls_2 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_fall11/2011_09_26_16_51_00.ULS',' ',1,0);     % ULS is the laser data 

tu_2 = uls_2(:,1);                   % Time (seconds), total time used: 1237.302 sec
ru_2 = uls_2(:,2) * 0.3048;          % Laser range (changed from feet to meters) 
altu_2 = interp1(tgps_2,alt_2,tu_2); % Finding altitude by interpolating the gps data at laser times
elev_2 = altu_2 - ru_2;              % elevation based on gps and laser data
                                     %
latu_2 = interp1(tgps_2,lat_2,tu_2); % latitude interpolated from gps data at laser times 
lonu_2 = interp1(tgps_2,lon_2,tu_2); % longitude interpolated from gps data at laser times 
d_2 = dist_track(latu_2, lonu_2);    % 'dist_track' is a function that is also in the folder.  
                                     % It computes the distance along the track. 

% Flight 2 Laser 2 (second time laser was held out)                                 
                                 
uls2_2 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_fall11/2011_09_26_17_15_00.ULS',' ',1,0);     % ULS is the laser data 

tu2_2 = uls2_2(:,1);                    % Time (seconds), total time used: 1237.302  sec
ru2_2 = uls2_2(:,2) * 0.3048;           % Laser range (changed from feet to meters)  
altu2_2 = interp1(tgps_2,alt_2,tu2_2); % Finding altitude by interpolating the gps data at laser times             %
elev2_2 = altu2_2 - ru2_2;             % elevation based on gps and laser data 
                                       %
latu2_2 = interp1(tgps_2,lat_2,tu2_2);  % latitude interpolated from gps data at laser times
lonu2_2 = interp1(tgps_2,lon_2,tu2_2);  % longitude interpolated from gps data at laser times
d2_2 = dist_track(latu2_2, lonu2_2);   % 'dist_track' is a function that is also in the folder.
                                       % It computes the distance along the track. 

                                       
%% Summer 2012 Test Data (July 9th) (_3)%%

% GPS Data

gps_3 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_sum12/gps_v2.txt',' ',0,0);

tgps_3 = gps_3(:,2);               % Time (seconds) starts at 1341853039 sec (less sig-figs than in 2011)
[tgps_3, i1, i2] = unique(tgps_3); % Time finds unique time clock has some repeat values takes second time 
                                   % of duplicates i1 are the indices of the times (see help unique)
lat_3 = floor(gps_3(i1,4)/100)+(mod(gps_3(i1,4),100))/60;   % latitude (North) (divide by 100)
lon_3 = -(floor(gps_3(i1,5)/100)+(mod(gps_3(i1,5),100))/60);% longitude (West)
alt_3 = gps_3(i1,3);                                        % altitude (meters)

% Laser Data

uls_3 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_sum12/laser_v3.txt',' ',0,0);  % ULS is the laser data

tu = uls_3(:,2);                 % System time (seconds)
t_ul = uls_3(:,8);               % Laser time since the laser was turned on
t_ulm = t_ul(1);                 % First laser time (for reference point)
t_ul2 = t_ul - t_ulm;            % Reindex laser time to start at t=0
tu2 = min(tu)+t_ul2;             % Line up the start of Laser time with start of System time

% There are bad, extraneous laser times and the following four lines
% replace these bad points with Nan (see plot(tu2))
i = find(tu2 < tu2(1));       
tu2(i) = NaN;
i2 = find(tu2 > tu2(length(tu2))); 
tu2(i2) = NaN;

% After replacing the bad values with Nan we now use interpolation to fill
% those points back in with reasonable values (always use tu_3 over tu2)
len_tu = length(tu);
tu_3 = [tu2(1):(tu2(len_tu)-tu2(1))/len_tu:tu2(len_tu)];

% Ranges: First, Second, Third, Strongest and Last
ru1 = uls_3(:,3);
ru2 = uls_3(:,4);
ru3 = uls_3(:,5);
rustr = uls_3(:,6);
rulast = uls_3(:,7);

latu_3 = interp1(tgps_3,lat_3,tu); % latitude (North)
lonu_3 = interp1(tgps_3,lon_3,tu); % longitude (West)
altu_3 = interp1(tgps_3,alt_3,tu); % altitude (meters)

% Elevations: First, Second, Third, Strongest, and Last
elev1    = altu_3 - ru1;
elev2    = altu_3 - ru2;
elev3    = altu_3 - ru3;
elevstr  = altu_3 - rustr;
elevlast = altu_3 - rulast;


%% Fall 2012 Test Data (October 1st) (_4)%%

% GPS Data

gps_4 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_fall12/Oct1st2012gps.txt',' ',30,0); 

lat_4 = gps_4(:,3);                  % Latitude (North)
lon_4 = -gps_4(:,4);                 % Latitude (North)
alt_4 = gps_4(:,6);                  % Altitude (meters)
tgps_4 = gps_4(:,1);                 % Time (seconds) starts at 1349115791.678150 sec

% Laser Data

uls_4 = dlmread('~/Desktop/Bering_Stuff/make_data_products/in_data_fall12/Oct1st2012.txt',' ',1,0);     % ULS is the laser data 
 
tu_4 = uls_4(:,1);                   % Time (seconds), total time used: 9172.4982 sec
ru_4 = uls_4(:,2);                   % Laser range (meters, no need to convert from feet)  
altu_4 = interp1(tgps_4,alt_4,tu_4); % Finding altitude by interpolating the gps data at laser times 
elev_4 = altu_4 - ru_4;              % Elevation based on gps and laser data
                                     %
latu_4 = interp1(tgps_4,lat_4,tu_4); % Latitude interpolated from gps data at laser times 
lonu_4 = interp1(tgps_4,lon_4,tu_4); % Longitude interpolated from gps data at laser times
d_4 = dist_track(latu_4, lonu_4);    % 'dist_track' is a function that is also in the folder.  
                                     % It computes the distance along the track. 
                                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


























