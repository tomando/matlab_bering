% Make bering surface for model
% Need a rectangular box as a DEM -> use .dtm with 0's where dtm is not
% calculated inside the box
% Thomas Trantow
% 07/17/2013
%--------------------------------------------------------------------------
% DEM resolution
res = 200; %meters

% DEM box
% Bering
%x = (336000:res:444800);
%y = (6660000:res:6719800);
% Bering - Bagley
x = (336000:res:500000);
y = (6660000:res:6724000);

% Unikrg calculation of DEM
DTM = load('data/s4_BB.dtm');

%Pre-allocate
Data = zeros(length(x)*length(y),3);

counter = 0;

for j = 1:length(y)
    for i = 1:length(x)
        counter = counter +1;
        x_temp = x(i);
        y_temp = y(j);
        
        Data(counter,1) = x_temp;
        Data(counter,2) = y_temp;
        
        d = find(DTM(:,1) == x_temp & DTM(:,2) == y_temp);
        
        % If  a point in the dtm file use the elevation else leave as 0
        if ~isempty(d)
            Data(counter,3) = DTM(d,3);
        end
    end
end

% Write to a file
dlmwrite('BB_surf_v6.dat',Data,'delimiter',' ','precision',10);

%--------------------------------------------------------------------------