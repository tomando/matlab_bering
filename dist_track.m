% Date: 2011-09-30
% Author: Maciej Stachura
% Purpose: Computing along-track distance.

function d = dist_track(lat,lon)
% Compute along track distance with [lat(1) lon(1)] as the starting point.

R_e       = 6378137;
d = zeros(size(lat));
d(1) = 0;

for i = 2:length(lat)
  if isnan(lat(i-1)) | isnan(lon(i-1))
      continue
  end
  d_lat = (lat(i) - lat(i-1))*pi/180;
  d_lon = (lon(i) - lon(i-1))*pi/180;
  d(i) = d(i-1) + R_e*2*sqrt( (d_lat/2).^2 + cos(lat(i-1)*pi/180).*cos(lat(i)*pi/180).*(d_lon/2).^2 );
end


