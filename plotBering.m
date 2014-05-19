% Date: 2011-09-30
% Author: Maciej Stachura
% Purpose: Plot the bering image from google maps.

%tmAxis = [-144 -141 60 61];
tmAxis = [-144.520933 -142.04 59.8175 60.7150561];

% Google image
[tmImg,tmMap]=imread('data/bering_color.png');

% Nasa image
%[tmImg,tmMap]=imread('data/bering_nasa.png');
%tmImg = flipdim(tmImg,1);

if exist('bw') && bw == 1
  [tmImg,tmMap]=imread('data/bering_gray.png');
end

% Google
hi = image([-144, -141], [60, 61], tmImg);
% Nasa
%hi = image([-144.520933, -142.04], [59.8175, 60.7250561], tmImg);

set(gca, 'YDir','normal');
%axis(tmAxis);
daspect([2,1,1])
axis([-143.7 -142.3 60.1 60.55])

