% Varoigrams for fixed parameter values based on all_data
% Thomas Trantow
% 08/14/2013
close all
clear all
clc

wantsave =1;

s1 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s1/Variograms/variotot.dat');
s2 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s2/Variograms/variotot.dat');
s3 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s3/Variograms/variotot.dat');
s4 = load('~/Desktop/Bering_Stuff/cryosat_analysis/s4/Variograms/variotot.dat');

% All data variogram values
nugget = 125.69;
sill = 601960.59;
range = 65992.11;
c1 = sill-nugget;

% Individual variogram values
nug1 = 103.18;
sill1 = 434836.52;
range1 = 92186.19/sqrt(3);
c1_1 = sill1 - nug1;

nug2 = 56.83;
sill2 = 614706.60;
range2 = 112306.63/sqrt(3);
c1_2 = sill2 - nug2;

nug3 = 148.83;
sill3 = 630174.70;
range3 = 123425.90/sqrt(3);
c1_3 = sill3 - nug3;

nug4 = 16.8;
sill4 = 616228.85;
range4 = 113781.69/sqrt(3);
c1_4 = sill4 - nug4;

x = 0:45000; % x axis points
% Gaussian
G = nugget + c1*(1- exp(-(x.^2/range^2)));

G1 = nug1 + c1_1*(1- exp(-(x.^2/range1^2)));
G2 = nug2 + c1_2*(1- exp(-(x.^2/range2^2)));
G3 = nug3 + c1_3*(1- exp(-(x.^2/range3^2)));
G4 = nug4 + c1_4*(1- exp(-(x.^2/range4^2)));

% Gaussian fit with Variogram
fig1 = figure('Position', [100, 100, 800, 450]);
plot(s1(:,2),s1(:,4),'b.')
set(gca,'FontSize',20);
hold on
plot(x,G,'g','LineWidth',2)
plot(x,G1,'r','LineWidth',2)
title('Gaussian fit to variogram')
xlabel('h (meters)')
ylabel('\gamma(h)')
if wantsave ==1
    saveas(fig1,strcat('~/Desktop/Bering_Stuff/cryosat_analysis/s1/Variograms/s1_G1_fixed.jpg'));
end

fig2 = figure('Position', [100, 100, 800, 450]);
plot(s2(:,2),s2(:,4),'b.')
set(gca,'FontSize',20);
hold on
plot(x,G,'g','LineWidth',2)
plot(x,G2,'r','LineWidth',2)
title('Gaussian fit to variogram')
xlabel('h (meters)')
ylabel('\gamma(h)')
if wantsave ==1
    saveas(fig2,strcat('~/Desktop/Bering_Stuff/cryosat_analysis/s2/Variograms/s2_G2_fixed.jpg'));
end

fig3 = figure('Position', [100, 100, 800, 450]);
plot(s3(:,2),s3(:,4),'b.')
set(gca,'FontSize',20);
hold on
plot(x,G,'g','LineWidth',2)
plot(x,G3,'r','LineWidth',2)
title('Gaussian fit to variogram')
xlabel('h (meters)')
ylabel('\gamma(h)')
if wantsave ==1
    saveas(fig3,strcat('~/Desktop/Bering_Stuff/cryosat_analysis/s3/Variograms/s3_G3_fixed.jpg'));
end

fig4 = figure('Position', [100, 100, 800, 450]);
plot(s4(:,2),s4(:,4),'b.')
set(gca,'FontSize',20);
hold on
plot(x,G,'g','LineWidth',2)
plot(x,G4,'r','LineWidth',2)
title('Gaussian fit to variogram')
xlabel('h (meters)')
ylabel('\gamma(h)')
if wantsave ==1
    saveas(fig1,strcat('~/Desktop/Bering_Stuff/cryosat_analysis/s4/Variograms/s4_G4_fixed.jpg'));
end