% Take every other data point

close all

D = load('s4_tot_G_alt_on.dat');
d = length(D);
F = zeros(round(ceil(d)/2),3);
f = length(F);
for i =1:f
    if mod(i,2) == 1
        F(round((i+1)/2),:) = D(i,:);
    end
end

dlmwrite('s4_tot_G_alt_on_sm.day',F,'delimiter',' ','precision',14);
plotBeringUTM
hold on
scatter(F(:,1),F(:,2),30,F(:,3),'filled')
colorbar