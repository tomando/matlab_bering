% Make matrix file for plotxy
% nan values ouside glacier
% calculated inside the box
% Thomas Trantow
% 07/17/2013
%--------------------------------------------------------------------------

% DEM resolution
res = 200; %meters

% DEM box
% Bering
%x = (352000:res:421900);
%y = (6660000:res:6719800);
% Bagley
x = (408000:res:500000);
y = (6690000:res:6724000);
% Bering - Bagley
%x = (336000:res:500000);
%y = (6660000:res:6724000);

x_len = length(x);
y_len = length(y);

% Data file
%D = load('s4_G_fixed_on.dat');
D = load('~/Desktop/Bering_Stuff/Bering_Model/data/BB_bed_v3_on.dat');
%Pre-allocate
Data = 9999*ones(x_len,y_len);

counter = 0;

for j = 1:y_len
    for i = 1:x_len
        
        d = find(D(:,1) == x(i) & D(:,2) == y(j));
        
        % If  a point in the dtm file use the elevation else leave as 0
        if ~isempty(d)
            Data(i,j) = D(d,3);
        end
        
        
    end
end

% Write to a file
dlmwrite('BB_bed_bag.mx',Data,'delimiter',' ','precision',10);

%--------------------------------------------------------------------------