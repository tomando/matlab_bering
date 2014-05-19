% Take every 10th/20th point from laser data to be used for variograms
% Thomas Trantow
% 07/10/13

F1 = load('~/Desktop/Bering_Stuff/laser_analysis/fall11/f11_filtered_UTM.dat');
F2 = load('~/Desktop/Bering_Stuff/laser_analysis/fall12/f12_filtered_UTM.dat');

len1 = length(F1);
len2 = length(F2);

newlen1 = floor(len1/10);
newlen2 = floor(len2/20);

F1_small = zeros(newlen1,3);
F2_small = zeros(newlen2,3);

counter1 = 0;
counter2 = 0;

for i = 1:10:(newlen1*10)
    counter1 = counter1+1;
    F1_small(counter1,:) = F1(i,:);
end


for i = 1:10:(newlen2*10)
    counter2 = counter2+1;
    F2_small(counter2,:) = F2(i,:);
end

dlmwrite('~/Desktop/Bering_Stuff/laser_analysis/fall11/f11_small.dat',F1_small,'delimiter',' ','precision',14);
dlmwrite('~/Desktop/Bering_Stuff/laser_analysis/fall12/f12_small.dat',F2_small,'delimiter',' ','precision',14);