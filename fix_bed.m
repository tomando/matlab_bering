% Fix where bed topography is greater than or equal to surface topagraphy
% Thomas Trantow
% 04/11/13

% Surface DEM
A = load('cryosat_on_v1_on.dat');

% Bed DEM
bed = 'bering_bed_HC_on.dat';
B = load(bed);

% Difference vector
C = A(:,3) - B(:,3);

% Preallocate corrected vector
D = zeros(length(C),1);

% Make minimum distance from bedrock to surface 1 meter and ignore data
% outside of the glacier (leave as -9999)
for i = 1:length(C)
    if C(i) < 1 && B(i,3)~=-9999
        D(i) = A(i,3) - 1;
    else
        D(i) = B(i,3); 
    end   
end


Data = [B(:,1) B(:,2) D];

% Write data to file
w = bed(end-3:end);
name = strrep(bed,w,'_c.dat');
dlmwrite(name,Data,' ');
