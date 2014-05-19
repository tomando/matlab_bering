% Date: 2013-03-11
% Author: Maciej Stachura, Thomas Trantow
% Purpose: Plot the bering image from google maps using UTM coordinates.

% so the picture fits better
tmAxis = [332705.1787208235 500000 6655205.468692469 6762787.336089718];
[tmImg,tmMap]=imread('data/bering_color.png');
if exist('bw') && bw == 1
  [tmImg,tmMap]=imread('bering_gray.png');
end


hi = image([332705.1787208235, 500000], [6655205.468692469, 6762787.336089718], tmImg);
set(gca, 'YDir','normal');
axis(tmAxis);
