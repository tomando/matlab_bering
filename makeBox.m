% Make data into a box with values of -9999 where data is missing in the
% box

%Thomas Trantow
% 07/08/13

S = load('all_on_G_alt.dat');
M = zeros(1090*600,3);
counter = 0;
for j = 6.660000e+06:100:6.719900e+06
    for i = 0.33600e+06:100:0.44490e+06
        counter = counter+1;
        I = find(S(:,1)==i & S(:,2) == j);
        if ~isempty(I)
            