% Find the spacing between track points

D = load('bering_bed_UTM.dat');

S = zeros(length(D)-1,1);

for i = 1:length(D)-1
    S(i) = sqrt((D(i+1,1)-D(i,1))^2 +(D(i+1,2)-D(i,2))^2 );
end

disp(S)

disp('Average spacing')
disp(mean(S))