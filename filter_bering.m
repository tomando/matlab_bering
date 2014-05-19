% Filter Bering Flight Data
% Thomas Trantow
% 05/13/2013

close all
clear all
clc

% Fall 2011 Flight 1 Sample 1

f1= load('Flight1_1_2011');
% plotBering
% hold on
% scatter(f1(:,1),f1(:,2),30,f1(:,3))
% colorbar

counter1 = 0;
for i = 1:length(f1)
    if f1(i,3) < 800
        counter1 = counter1+1;
        g1(counter1,:) = f1(i,:);
    end
end

% figure
% plotBering
% hold on
% scatter(g1(:,1),g1(:,2),30,g1(:,3))
% colorbar



% Fall 2011 Flight 1 Sample 2

f2= load('Flight1_2_2011');
% figure
% plotBering
% hold on
% scatter(f2(:,1),f2(:,2),30,f2(:,3))
% colorbar

counter2 = 0;
for i = 1:length(f2)
    if f2(i,3) < 750
        counter2 = counter2+1;
        g2(counter2,:) = f2(i,:);
    end
end

% figure
% plotBering
% hold on
% scatter(g2(:,1),g2(:,2),30,g2(:,3))
% colorbar



% Fall 2011 Flight 2 Sample 1

f3= load('Flight2_1_2011');
% figure
% plotBering
% hold on
% scatter(f3(:,1),f3(:,2),30,f3(:,3))
% colorbar

counter3 = 0;
for i = 1:length(f3)
    if f3(i,3) < 700
        if i < 36115
        else
        counter3 = counter3+1;
        g3(counter3,:) = f3(i,:);
        end
    end
end

% figure
% plotBering
% hold on
% scatter(g3(:,1),g3(:,2),30,g3(:,3))
% colorbar
% 



% Fall 2011 Flight 2 Sample 2

f4= load('Flight2_2_2011');
% figure
% plotBering
% hold on
% scatter(f4(:,1),f4(:,2),30,f4(:,3))
% colorbar

counter4 = 0;
for i = 1:length(f4)
    if f4(i,3) < 725
        if (i > 140000 && f4(i,3) > 400) || (i > 172246)
        else
        counter4 = counter4+1;
        g4(counter4,:) = f4(i,:);
        end
    end
end

% figure
% plotBering
% hold on
% scatter(g4(:,1),g4(:,2),30,g4(:,3))
% colorbar




% Summer 2012 - Crap data don't use

f5= load('Summer_2012');
% figure
% plotBering
% hold on
% scatter(f5(:,1),f5(:,2),30,f5(:,3))
% colorbar




% Fall 2012 (doesn't need filtering)

f6= load('Fall_2012_on');
% figure
% plotBering
% hold on
% scatter(f6(:,1),f6(:,2),30,f6(:,3))
% colorbar



% Combining data:

% All data combined
f = cat(1,f1,f2,f3,f4,f5,f6);
% figure
% plotBering
% hold on
% scatter(f(:,1),f(:,2),30,f(:,3))
% colorbar
% caxis([0 1200])

% All no summer
fs = cat(1,f1,f2,f3,f4,f6);
% figure
% plotBering
% hold on
% scatter(fs(:,1),fs(:,2),30,fs(:,3))
% colorbar
% caxis([0 1000])

% All filtered
% g = cat(1,g1,g2,g3,g4,f6);
% figure
% plotBering
% hold on
% scatter(g(:,1),g(:,2),30,g(:,3),'filled')
% h = colorbar;
% title('Fall 2011 and Fall 2012')
% ylabel(h, 'surface elevation (m)');
%dlmwrite('f11andf12_filtered',g,'delimiter',' ','precision',14)


% 2011 Filtered
% y1 = cat(1,g1,g2,g3,g4);
% figure
% plotBering
% hold on
% scatter(y1(:,1),y1(:,2),30,y1(:,3),'filled')
% h= colorbar;
% title('Fall 2011')
% ylabel(h, 'surface elevation (m)');
%dlmwrite('f11_filtered',y1,'delimiter',' ','precision',14)

% 2012 filtered
y2 = f6;
figure
plotBering
hold on
scatter(y2(:,1),y2(:,2),30,y2(:,3),'filled')
h = colorbar;
title('Fall 2012')
ylabel(h, 'surface elevation (m)');
dlmwrite('f12_filtered',y2,'delimiter',' ','precision',14)



