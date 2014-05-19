% Shape factor
clc
A = [-142.962342, 60.4361973; -142.914135,60.3496094; -142.688243,60.5039062;-142.557464,60.4746094;-143.347737,60.2862408;-143.529105,60.2918936;-143.235392,60.2306921;-143.599299,60.2186696];
[x,y] = deg2utm(A(:,2),A(:,1));

% Mid A(1:2)
midwidth = sqrt((x(2)-x(1))^2 + (y(2)-y(1))^2);
midthick = 800;
midshape = (2/pi)*atan(.5*midwidth/midthick);
disp('Mid-glacier shape factor (m)')
disp(midshape)

% Upper A(3:4)
upperwidth = sqrt((x(4)-x(3))^2 + (y(4)-y(3))^2);
upperthick = 975;
uppershape = (2/pi)*atan(.5*upperwidth/upperthick);
disp('Upper-glacier shape factor (m)')
disp(uppershape)

% Kit-grindle A(5:6)
kitgrinwidth = sqrt((x(6)-x(5))^2 + (y(6)-y(5))^2);
kitgrinthick = 340;
kitgrinshape = (2/pi)*atan(.5*kitgrinwidth/kitgrinthick);
disp('Kittrov Grendel area shape factor (m)')
disp(kitgrinshape)

% Lobus A(7:8)
lobuswidth = sqrt((x(8)-x(7))^2 + (y(8)-y(7))^2);
lobusthick = 360;
lobusshape = (2/pi)*atan(.5*lobuswidth/lobusthick);
disp('Lobus shape factor (m)')
disp(lobusshape)