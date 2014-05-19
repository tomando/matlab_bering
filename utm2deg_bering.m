% convert UTM to lat/lon on bering glacier
% Thomas Trantow
% 06/26/13

function [Lat,Lon] = utm2deg_bering(filename)
    if isnumeric(filename)
        len = length(filename);
        zone = '07 V';
        utmzone = repmat(zone,len,1);
        [Lat,Lon] = utm2deg(filename(:,1),filename(:,2),utmzone);
        
    else
        D = load(filename);
        % UTM zone for bering is 07 V
        len = length(D);
        zone = '07 V';
        utmzone = repmat(zone,len,1);
        [Lat,Lon] = utm2deg(D(:,1),D(:,2),utmzone);

    end
% Plot
% plotBering
% set(gca,'FontSize',40);
% ylabel('Latitude','FontSize',50);
% xlabel('Longitude','FontSize',50);
% hold on
% scatter(Lon,Lat,75,D(:,3),'filled')
% h = colorbar;
% set(h,'fontsize',40);
% caxis([0 1200]);
% ylabel(h,'elevation (m)','FontSize',50);
end