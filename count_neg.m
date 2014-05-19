% Find where bed topography is higher than surface
% Thomas Trantow
% 04/09/13

% Surface and Bed DEMs
A = load('cryosat_on_v1_on.dat');
B = load('bering_bed_HC_on_c.dat');

% Ice thickness: Difference between surface and bed elevations
C = A(:,3) - B(:,3);

counter = 0;
counter1 = 0;

for i = 1:length(C)
    % Put negative values in matrix Z3
    if C(i) < 0
        counter = counter +1;
        Z1(counter,1) = A(i,1);
        Z2(counter,1) = A(i,2);
        Z3(counter,1) = C(i);
    
    else
        % Put non-negative values in a matrix Z4
        counter1 = counter1+1;
        Z4(counter1,1) = C(i);
    end
end

% Vaious plotting options
plotBeringUTM
hold on
%scatter(Z1,Z2,30,Z3)
scatter(A(:,1),A(:,2),30,C)
colorbar();
%plot(Z1,Z2,'k.')

% Display various values
disp('Average ice thickness: ')
ithk = sum(C)/length(C);
disp(ithk);
disp('Average negative difference: ')
negthk = sum(Z3)/length(Z3);
disp(negthk)
disp('Avererage non-negative thickness: ')
posthk = sum(Z4)/length(Z4);
disp(posthk)
disp('Number of negative ice thicknesses: ')
disp(counter);