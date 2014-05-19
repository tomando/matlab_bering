% Date: 2011-09-30
% Author: Maciej Stachura
% Purpose: Plot the bering image from google maps.

tmAxis = [-144 -142 60 61];

[tmImg,tmMap]=imread('data/bering_color.png');

if exist('bw') && bw == 1
  [tmImg,tmMap]=imread('data/bering_gray.png');
end


hi = image([-144, -141], [60, 61], tmImg);
set(gca, 'YDir','normal');
%axis equal
daspect([2,1,1])
axis([-143.75 -142.9 60 60.45]);
