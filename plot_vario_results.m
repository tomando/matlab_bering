% plot_vario_results.m
% Plots vario results with all fits and save to folder
% Thomas Trantow
% 04/18/2013

%------Housekeeping--------------------------------------------------------
close all
clear all
clc 
set(gcf,'Visible','on');
set(0,'DefaultFigureVisible','on'); 
%--------------------------------------------------------------------------

%------Enter Specifics Here------------------------------------------------

x = 0:45000; % x axis points
wantsave = 1; % 1 if you want to save the plots

% Laser data or cryosat data
str0 = 'cryosat';
% What season? fall11, fall12, s1, s2, s3, s4, or all
str1 ='all';
% What variogram? 90 or tot
str2 = 'tot';

% Parameters (from variofit most likely)
if strcmp(str1,'s1')
    nugget = 103.18;
    sill = 434836.58;
    range = 53221.99;
elseif strcmp(str1,'s2')
    %nugget = 56.83;
    sill = 614706.64;
    range = 64840.26;
    nugget = 27.28;
elseif strcmp(str1,'s3')
    nugget = 148.83;
    sill = 630175.57;
    range = 71260.03;
elseif strcmp(str1,'s4')
    nugget = 16.8;
    sill = 623423.09;
    range = 70785.74;
elseif strcmp(str1,'all')
    nugget =125.69;
    sill = 601960.59;
    range = 65992.11;
end

c1 = sill-nugget;

% Label plot with parameters? Use empty string if no.
str3 = cat(2,'Nugget: ',num2str(nugget) , ', Sill: ',num2str(sill),', Range: ',num2str(range));
%str3 = '\gamma(h)';

% If alternate version
%str6 = '_b';
str6 = '';
%--------------------------------------------------------------------------

if strcmp(str1,'s1')
    str5 = 'May 2011 to October 2011';
elseif strcmp(str1,'s2')
    str5 = 'November 2011 to April 2012';
elseif strcmp(str1,'s3')
    str5 = 'May 2012 to October 2012';
elseif strcmp(str1,'s4')
    str5 = 'November 2012 to April 2013';
elseif strcmp(str1,'all')
    str5 = 'May 2011 to April 2013';
else
    str5 = '';
end

%------Working Code--------------------------------------------------------
%s = load('variotot.dat');
s = load(strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/vario',str2,'.dat'));

% Assign values to variables
Lag = s(:,2);
mean = s(:,3);
vario = s(:,4);
res_vario = s(:,5);
len = length(x);


% Gaussian
G = nugget + c1*(1- exp(-(x.^2/range^2)));

% Linear
L = zeros(1,len);
for i = 1:len
    if(i <= range)
        L(i) = nugget + (c1/range)*x(i);
    else
        L(i) = nugget+c1;
    end
end

% Exponential
E = nugget + c1*(1 - exp(-(3*x)./range));

% Spherical
S = zeros(1,len);
for i = 1:len
    if(i <= range)
        S(i) = nugget + c1*((3*x(i))/(2*range) - x(i)^3/(2*range^3));
    else
        S(i) = nugget+c1;
    end
end



% Plot

% Variogram
fig1 = figure('Position', [100, 100, 800, 450]);
plot(Lag,vario,'b.','MarkerSize',20)
set(gca,'FontSize',20);
title('Variogram')
xlabel('Lag (meters)')
ylabel(str3)
if wantsave ==1
    saveas(fig1,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','vario_use_',str2,'_',str1,str6,'.jpg'));
end
% Residual Variogram
fig2 = figure('Position', [100, 100, 800, 450]);
plot(Lag,res_vario,'k.')
set(gca,'FontSize',20);
title('Residual Variogram')
xlabel('Lag (meters)')
if wantsave ==1
    saveas(fig2,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','resvario_',str2,'_',str1,str6,'.jpg'));
end
% Mean
fig3 = figure('Position', [100, 100, 800, 450]);
plot(Lag,mean,'r.')
set(gca,'FontSize',20);
title('Mean')
if wantsave ==1
    saveas(fig3,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','mean_',str2,'_',str1,str6,'.jpg'));
end
% Gaussian fit with Variogram
fig4 = figure('Position', [100, 100, 800, 450]);
plot(Lag,vario,'b.')
set(gca,'FontSize',20);
hold on
plot(x,G,'g','LineWidth',2)
title('Gaussian fit to variogram')
xlabel('Lag (meters)')
ylabel(str3)
if wantsave ==1
    saveas(fig4,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','gaussian_',str2,'_',str1,str6,'.jpg'));
end
% Linear fit to variogram
fig5 = figure('Position', [100, 100, 800, 450]);
plot(Lag,vario,'b.')
set(gca,'FontSize',20);
hold on
plot(x,L,'r','LineWidth',2)
title('Linear fit to variogram')
xlabel('Lag (meters)')
ylabel(str3)
if wantsave ==1
    saveas(fig5,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','linear_',str2,'_',str1,str6,'.jpg'));
end
% Exponential fit to variogram
fig6 = figure('Position', [100, 100, 800, 450]);
plot(Lag,vario,'b.')
set(gca,'FontSize',20);
hold on
plot(x,E,'k','LineWidth',2)
title('Exponential fit to variogram')
xlabel('Lag (meters)')
ylabel(str3)
if wantsave ==1
    saveas(fig6,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','exponential_',str2,'_',str1,str6,'.jpg'));
end
% Spherical fit to variogram
fig7 = figure('Position', [100, 100, 800, 450]);
plot(Lag,vario,'b.','MarkerSize',15)
set(gca,'FontSize',20);
hold on
plot(x,S,'m','LineWidth',2.25)
title('Spherical fit to variogram')
xlabel('Lag (meters)')
ylabel(str3)
if wantsave ==1
    saveas(fig7,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','spherical_',str2,'_',str1,str6,'.jpg'));
end

% Fitting the data to a Gaussian curve (takes previous values as initial
% guesses)
%
% Fit nugget, c1, and range values
n = fittype('C0+C1*(1-exp(-x^2/a^2))','coeff',{'C0','C1','a'});
N = fit(Lag,vario,n,'StartPoint',[nugget,c1,range]);
variogfit1= N(x);
str4 = cat(2,'Nugget: ',num2str(N.C0) , ', Sill: ',num2str(N.C1+N.C0),', Range: ',num2str(N.a));
%str4 = '\gamma(h)';
fig8 = figure('Position', [100, 100, 800, 450]);
plot(Lag,vario,'b.','Markersize',15)
set(gca,'FontSize',20);
hold on
plot(x,variogfit1,'m','LineWidth',2.25)
title('An alternate Gaussian fit to variogram (with nugget fitting)')
xlabel('Lag (meters)')
ylabel(str4)
if wantsave ==1
    saveas(fig8,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','Gaussian_alt1_',str2,'_',str1,str6,'.jpg'));
end

% Fit c1(C2) and range(A) values given nugget from variofit (in case previous
% gives negative nugget)
f = fittype('C2*(1-exp(-x^2/A^2))','coeff',{'C2','A'});
F = fit(Lag,vario-nugget,f,'StartPoint',[c1,range]);
variogfit2= nugget + F(x);
%str4 = cat(2,'Nugget: ',num2str(nugget) , ', Sill: ',num2str(F.C2+nugget),', Range: ',num2str(F.A));
str4 = '\gamma(h)';
fig9 = figure('Position', [100, 100, 800, 450]);
plot(Lag,vario,'b.','MarkerSize',15)
set(gca,'FontSize',15);
hold on
plot(x,variogfit2,'r','LineWidth',2.25)
%title('An alternate Gaussian fit to variogram (without nugget fitting)')
%title('Gaussian fit to variogram')
title(str5,'FontWeight','bold')
xlabel('h (meters)')
ylabel(str4)
if wantsave ==1
    saveas(fig9,strcat('~/Desktop/Bering_Stuff/',str0,'_analysis/',str1,'/Variograms',str6,'/',str2,'_plots/','Gaussian_alt2_',str2,'_',str1,str6,'.jpg'));
end

%--------------------------------------------------------------------------









