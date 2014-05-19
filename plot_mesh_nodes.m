% Analyze Data from paraview
close all
clear all

wantbed= 0;

s1t1 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s1/bering_ex/time1.csv');
s1t182 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s1/bering_ex/time182.csv');
s1t365 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s1/bering_ex/time365.csv');
s1t547 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s1/bering_ex/time547.csv');
s1t720 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s1/bering_ex/time720.csv');

s2t1 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s2/bering_ex/time1.csv');
s2t182 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s2/bering_ex/time182.csv');
s2t365 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s2/bering_ex/time365.csv');
s2t547 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s2/bering_ex/time547.csv');
s2t720 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s2/bering_ex/time720.csv');

s3t1 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_BB_Finer/bering_ex/time1.csv');
s3t182 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_BB_Finer/bering_ex/time182.csv');
s3t365 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_BB_Finer/bering_ex/time365.csv');
s3t547 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_BB_Finer/bering_ex/time547.csv');
s3t720 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_BB_Finer/bering_ex/time720.csv');

s4t1 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s4/bering_ex/time1.csv');
s4t182 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s4/bering_ex/time182.csv');
s4t365 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s4/bering_ex/time365.csv');
s4t547 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s4/bering_ex/time547.csv');
s4t720 = load('~/Desktop/Bering_Stuff/Bering_Model/Model_Results/Create_Mesh_s4/bering_ex/time720.csv');

ft = load('~/Desktop/Bering_Stuff/Bering_Model/data/flowline_BB_v2.dat');

len = length(ft);
[FL,IX] = sort(ft(:,1));
fl = zeros(len,2);
for l = 1:len
    fl(l,:) = ft(IX(l),:);
end
    

bed = s1t1(1:2331,31:33);

% Surface
s11 = s1t1(4663:6993,31:33);
s12 = s1t182(4663:6993,31:33);
s13 = s1t365(4663:6993,31:33);
s14 = s1t547(4663:6993,31:33);
s15 = s1t720(4663:6993,31:33);

s21 = s2t1(4663:6993,31:33);
s22 = s2t182(4663:6993,31:33);
s23 = s2t365(4663:6993,31:33);
s24 = s2t547(4663:6993,31:33);
s25 = s2t720(4663:6993,31:33);

s31 = s3t1(4663:6993,31:33);
s32 = s3t182(4663:6993,31:33);
s33 = s3t365(4663:6993,31:33);
s34 = s3t547(4663:6993,31:33);
s35 = s3t720(4663:6993,31:33);

s41 = s4t1(4663:6993,31:33);
s42 = s4t182(4663:6993,31:33);
s43 = s4t365(4663:6993,31:33);
s44 = s4t547(4663:6993,31:33);
s45 = s4t720(4663:6993,31:33);

% Center layer
c11 = s1t1(2332:4662,31:33);
c12 = s1t182(2332:4662,31:33);
c13 = s1t365(2332:4662,31:33);
c14 = s1t547(2332:4662,31:33);
c15 = s1t720(2332:4662,31:33);

c21 = s2t1(2332:4662,31:33);
c22 = s2t182(2332:4662,31:33);
c23 = s2t365(2332:4662,31:33);
c24 = s2t547(2332:4662,31:33);
c25 = s2t720(2332:4662,31:33);

c31 = s3t1(2332:4662,31:33);
c32 = s3t182(2332:4662,31:33);
c33 = s3t365(2332:4662,31:33);
c34 = s3t547(2332:4662,31:33);
c35 = s3t720(2332:4662,31:33);

c41 = s4t1(2332:4662,31:33);
c42 = s4t182(2332:4662,31:33);
c43 = s4t365(2332:4662,31:33);
c44 = s4t547(2332:4662,31:33);
c45 = s4t720(2332:4662,31:33);


b = zeros(len,3);

p1 = zeros(len,3);
p2 = zeros(len,3);
p3 = zeros(len,3);
p4 = zeros(len,3);
p5 = zeros(len,3);

p6 = zeros(len,3);
p7 = zeros(len,3);
p8 = zeros(len,3);
p9 = zeros(len,3);
p10 = zeros(len,3);

p11 = zeros(len,3);
p12 = zeros(len,3);
p13 = zeros(len,3);
p14 = zeros(len,3);
p15 = zeros(len,3);

p16 = zeros(len,3);
p17 = zeros(len,3);
p18 = zeros(len,3);
p19 = zeros(len,3);
p20 = zeros(len,3);

for i = 1:len
    b1 = find(bed(:,1) == fl(i,1) & bed(:,2) == fl(i,2));
    b(i,:) = bed(b1,:);
    
    P1= find(s11(:,1) == fl(i,1) & s11(:,2) == fl(i,2));
    p1(i,:) = s11(P1,:);
    P2 = find(s12(:,1) == fl(i,1) & s12(:,2) == fl(i,2));
    p2(i,:) = s12(P2,:);
    P3 = find(s13(:,1) == fl(i,1) & s13(:,2) == fl(i,2));
    p3(i,:) = s13(P3,:);
    P4 = find(s14(:,1) == fl(i,1) & s14(:,2) == fl(i,2));
    p4(i,:) = s14(P4,:);
    P5 = find(s15(:,1) == fl(i,1) & s15(:,2) == fl(i,2));
    p5(i,:) = s15(P5,:);
    
    P6 = find(s21(:,1) == fl(i,1) & s21(:,2) == fl(i,2));
    p6(i,:) = s21(P6,:);
    P7 = find(s22(:,1) == fl(i,1) & s22(:,2) == fl(i,2));
    p7(i,:) = s22(P7,:);
    P8 = find(s23(:,1) == fl(i,1) & s23(:,2) == fl(i,2));
    p8(i,:) = s23(P8,:);
    P9 = find(s24(:,1) == fl(i,1) & s24(:,2) == fl(i,2));
    p9(i,:) = s24(P9,:);
    P10 = find(s25(:,1) == fl(i,1) & s25(:,2) == fl(i,2));
    p10(i,:) = s25(P10,:);
    
    P11 = find(s31(:,1) == fl(i,1) & s31(:,2) == fl(i,2));
    p11(i,:) = s31(P11,:);
    P12 = find(s32(:,1) == fl(i,1) & s32(:,2) == fl(i,2));
    p12(i,:) = s32(P12,:);
    P13 = find(s33(:,1) == fl(i,1) & s33(:,2) == fl(i,2));
    p13(i,:) = s33(P13,:);
    P14 = find(s34(:,1) == fl(i,1) & s34(:,2) == fl(i,2));
    p14(i,:) = s34(P14,:);
    P15 = find(s35(:,1) == fl(i,1) & s35(:,2) == fl(i,2));
    p15(i,:) = s35(P15,:);
    
    P16 = find(s41(:,1) == fl(i,1) & s41(:,2) == fl(i,2));
    p16(i,:) = s41(P16,:);
    P17 = find(s42(:,1) == fl(i,1) & s42(:,2) == fl(i,2));
    p17(i,:) = s42(P17,:);
    P18 = find(s43(:,1) == fl(i,1) & s43(:,2) == fl(i,2));
    p18(i,:) = s43(P18,:);
    P19 = find(s44(:,1) == fl(i,1) & s44(:,2) == fl(i,2));
    p19(i,:) = s44(P19,:);
    P20 = find(s45(:,1) == fl(i,1) & s45(:,2) == fl(i,2));
    p20(i,:) = s45(P20,:);
end

d = zeros(len,1);
for j = 2:len
    d(j,1) = sqrt((fl(j,1)-fl(j-1,1))^2 + (fl(j,2)-fl(j-1,2))^2) + d(j-1,1);    
end

[Lat,Lon] = utm2deg_bering(s11(:,1:2)); 

% Surface Differences
%s1
diff11 = s12(:,3) - s11(:,3);
diff12 = s13(:,3) - s12(:,3);
diff13 = s14(:,3) - s13(:,3);
diff14 = s15(:,3) - s14(:,3);
diff15 = s13(:,3) - s11(:,3);
diff16 = s14(:,3) - s12(:,3);
diff17 = s15(:,3) - s13(:,3);
diff18 = s14(:,3) - s11(:,3);
diff19 = s15(:,3) - s12(:,3);
diff110 = s15(:,3) - s11(:,3);

%s2
diff21 = s22(:,3) - s21(:,3);
diff22 = s23(:,3) - s22(:,3);
diff23 = s24(:,3) - s23(:,3);
diff24 = s25(:,3) - s24(:,3);
diff25 = s23(:,3) - s21(:,3);
diff26 = s24(:,3) - s22(:,3);
diff27 = s25(:,3) - s23(:,3);
diff28 = s24(:,3) - s21(:,3);
diff29 = s25(:,3) - s22(:,3);
diff210 = s25(:,3) - s21(:,3);

%s3
diff31 = s32(:,3) - s31(:,3);
diff32 = s33(:,3) - s32(:,3);
diff33 = s34(:,3) - s33(:,3);
diff34 = s35(:,3) - s34(:,3);
diff35 = s33(:,3) - s31(:,3);
diff36 = s34(:,3) - s32(:,3);
diff37 = s35(:,3) - s33(:,3);
diff38 = s34(:,3) - s31(:,3);
diff39 = s35(:,3) - s32(:,3);
diff310 = s35(:,3) - s31(:,3);

%s4
diff41 = s42(:,3) - s41(:,3);
diff42 = s43(:,3) - s42(:,3);
diff43 = s44(:,3) - s43(:,3);
diff44 = s45(:,3) - s44(:,3);
diff45 = s43(:,3) - s41(:,3);
diff46 = s44(:,3) - s42(:,3);
diff47 = s45(:,3) - s43(:,3);
diff48 = s44(:,3) - s41(:,3);
diff49 = s45(:,3) - s42(:,3);
diff410 = s45(:,3) - s41(:,3);

% Center Differences
%s1
diffc11 = c12(:,3) - c11(:,3);
diffc12 = c13(:,3) - c12(:,3);
diffc13 = c14(:,3) - c13(:,3);
diffc14 = c15(:,3) - c14(:,3);
diffc15 = c13(:,3) - c11(:,3);
diffc16 = c14(:,3) - c12(:,3);
diffc17 = c15(:,3) - c13(:,3);
diffc18 = c14(:,3) - c11(:,3);
diffc19 = c15(:,3) - c12(:,3);
diffc110 = c15(:,3) - c11(:,3);

%s2
diffc21 = c22(:,3) - c21(:,3);
diffc22 = c23(:,3) - c22(:,3);
diffc23 = c24(:,3) - c23(:,3);
diffc24 = c25(:,3) - c24(:,3);
diffc25 = c23(:,3) - c21(:,3);
diffc26 = c24(:,3) - c22(:,3);
diffc27 = c25(:,3) - c23(:,3);
diffc28 = c24(:,3) - c21(:,3);
diffc29 = c25(:,3) - c22(:,3);
diffc210 = c25(:,3) - c21(:,3);

%s3
diffc31 = c32(:,3) - c31(:,3);
diffc32 = c33(:,3) - c32(:,3);
diffc33 = c34(:,3) - c33(:,3);
diffc34 = c35(:,3) - c34(:,3);
diffc35 = c33(:,3) - c31(:,3);
diffc36 = c34(:,3) - c32(:,3);
diffc37 = c35(:,3) - c33(:,3);
diffc38 = c34(:,3) - c31(:,3);
diffc39 = c35(:,3) - c32(:,3);
diffc310 = c35(:,3) - c31(:,3);

%s4
diffc41 = c42(:,3) - c41(:,3);
diffc42 = c43(:,3) - c42(:,3);
diffc43 = c44(:,3) - c43(:,3);
diffc44 = c45(:,3) - c44(:,3);
diffc45 = c43(:,3) - c41(:,3);
diffc46 = c44(:,3) - c42(:,3);
diffc47 = c45(:,3) - c43(:,3);
diffc48 = c44(:,3) - c41(:,3);
diffc49 = c45(:,3) - c42(:,3);
diffc410 = c45(:,3) - c41(:,3);

diffc1 = p6(:,3) - p1(:,3);
diffc2 = p11(:,3) - p6(:,3);
diffc3 = p16(:,3) - p11(:,3);
diffc4 = p11(:,3) - p1(:,3);
diffc5 = p16(:,3) - p1(:,3);


fig1 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%a = plot(d,b(:,3),'b');
hold on
B = plot(d,p1(:,3),'r','LineWidth',2);
c = plot(d,p2(:,3),'g','LineWidth',2);
D = plot(d,p3(:,3),'k','LineWidth',2);
e = plot(d,p4(:,3),'c','LineWidth',2);
f = plot(d,p5(:,3),'m','LineWidth',2);
xlabel('Distance Along Flowline (m)','FontSize',20);
ylabel('Elevation (m)','FontSize',20);
title('Evolution of surface elevation (S1)','FontWeight','bold');
l1 = legend([B,c,D,e,f],'1 day', '182 days', '365 days', '547 days', '720 days','Location', 'NorthWest');
grid on


fig2 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%a = plot(d,b(:,3),'b');
hold on
B = plot(d,p6(:,3),'r','LineWidth',2);
c = plot(d,p7(:,3),'g','LineWidth',2);
D = plot(d,p8(:,3),'k','LineWidth',2);
e = plot(d,p9(:,3),'c','LineWidth',2);
f = plot(d,p10(:,3),'m','LineWidth',2);
xlabel('Distance Along Flowline (m)','FontSize',20);
ylabel('Elevation (m)','FontSize',20);
title('Evolution of surface elevation (S2)','FontWeight','bold');
l1 = legend([B,c,D,e,f],'1 day', '182 days', '365 days', '547 days', '720 days','Location', 'NorthWest');
grid on


fig3 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%a = plot(d,b(:,3),'b');
hold on
B = plot(d,p11(:,3),'r','LineWidth',2);
c = plot(d,p12(:,3),'g','LineWidth',2);
D = plot(d,p13(:,3),'k','LineWidth',2);
e = plot(d,p14(:,3),'c','LineWidth',2);
f = plot(d,p15(:,3),'m','LineWidth',2);
xlabel('Distance Along Flowline (m)','FontSize',20);
ylabel('Elevation (m)','FontSize',20);
title('Evolution of surface elevation (S3)','FontWeight','bold');
l1 = legend([B,c,D,e,f],'1 day', '182 days', '365 days', '547 days', '720 days','Location', 'NorthWest');
grid on


fig4 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%a = plot(d,b(:,3),'b');
hold on
B = plot(d,p16(:,3),'r','LineWidth',2);
c = plot(d,p17(:,3),'g','LineWidth',2);
D = plot(d,p18(:,3),'k','LineWidth',2);
e = plot(d,p19(:,3),'c','LineWidth',2);
f = plot(d,p20(:,3),'m','LineWidth',2);
xlabel('Distance Along Flowline (m)','FontSize',20);
ylabel('Elevation (m)','FontSize',20);
title('Evolution of surface elevation (S4)','FontWeight','bold');
l1 = legend([B,c,D,e,f],'1 day', '182 days', '365 days', '547 days', '720 days','Location', 'NorthWest');
grid on
    
    
fig5 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
a = plot(d,b(:,3),'b');
hold on
B = plot(d,p1(:,3),'r');
c = plot(d,p6(:,3),'g');
D = plot(d,p11(:,3),'k');
e = plot(d,p16(:,3),'c');
xlabel('Distance Along Flowline (m)','FontSize',20);
ylabel('Elevation (m)','FontSize',20);
title('Surface and Bed Elevation','FontWeight','bold');
l1 = legend([a,B,c,D,e],'Bed','S1', 'S2', 'S3', 'S4','Location', 'NorthWest');
grid on   


fig6 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%plotBering
hold on
%scatter(Lon,Lat,60,diff11,'filled')
scatter(s11(:,1),s11(:,2),60,diff11,'filled')
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'surface elevation change (m)');
title('S1 Elevation Difference After Six Months','FontWeight','bold');
caxis([-30 30])
axis([350000 420000 6660000 6720000])
grid on 

fig7 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%plotBering
hold on
%scatter(Lon,Lat,60,diff15,'filled')
scatter(s11(:,1),s11(:,2),60,diff15,'filled')
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'surface elevation change (m)');
title('S1 Elevation Difference After Twelve Months','FontWeight','bold');
caxis([-30 30])
axis([350000 420000 6660000 6720000])
grid on

fig8 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%plotBering
hold on
%scatter(Lon,Lat,60,diff18,'filled')
scatter(s11(:,1),s11(:,2),60,diff18,'filled')
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'surface elevation change (m)');
title('S1 Elevation Difference After Eighteen Months','FontWeight','bold');
caxis([-30 30])
axis([350000 420000 6660000 6720000])
grid on


fig9 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%plotBering
hold on
%scatter(Lon,Lat,60,diff21,'filled')
scatter(s11(:,1),s11(:,2),60,diff21,'filled')
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'surface elevation change (m)');
title('S2 Elevation Difference After Six Months','FontWeight','bold');
caxis([-10 10])
axis([350000 420000 6660000 6720000])
grid on

fig10 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%plotBering
hold on
%scatter(Lon,Lat,60,diff25,'filled')
scatter(s11(:,1),s11(:,2),60,diff25,'filled')
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'surface elevation change (m)');
title('S2 Elevation Difference After Twelve Months','FontWeight','bold');
caxis([-10 10])
axis([350000 420000 6660000 6720000])
grid on

fig11 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%plotBering
hold on
%scatter(Lon,Lat,60,diff31,'filled')
scatter(s11(:,1),s11(:,2),60,diff31,'filled')
h = colorbar();
set(h,'FontSize',20);
ylabel(h, 'surface elevation change (m)');
title('S3 Elevation Difference After Six Months','FontWeight','bold');
caxis([-20 20])
axis([350000 420000 6660000 6720000])
grid on




fig12 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%a = plot(d,b(:,3),'b');
hold on
B = plot(d,diffc1,'r','LineWidth',2);
c = plot(d,diffc2,'g','LineWidth',2);
D = plot(d,diffc3,'k','LineWidth',2);
xlabel('Distance Along Flowline (m)','FontSize',20);
ylabel('Elevation (m)','FontSize',20);
title('Change in Elevation along Centerline','FontWeight','bold');
l1 = legend([B,c,D],'S2-S1', 'S3-S2', 'S4-S3','Location', 'NorthWest');
grid on


fig12 = figure('Position', [100, 100, 800, 450]);
set(gca,'FontSize',15);
%a = plot(d,b(:,3),'b');
hold on
B = plot(d,diffc1,'r','LineWidth',2);
c = plot(d,diffc4,'g','LineWidth',2);
D = plot(d,diffc5,'k','LineWidth',2);
xlabel('Distance Along Flowline (m)','FontSize',20);
ylabel('Elevation (m)','FontSize',20);
title('Cumulative Change in Elevation along Centerline since Summer 2011','FontWeight','bold');
l1 = legend([B,c,D],'S2-S1', 'S3-S1', 'S4-S1','Location', 'NorthWest');
grid on












































    
    
    
    
    
    
    
    
    
    
    
    
    
    
    