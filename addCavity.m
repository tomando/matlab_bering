% Add cavity to bed rock dem
C = load('cavity_bering.dat');
D = load('BB_bed_v3.dat');

X = D(:,1);
Y = D(:,2);
ELEV = D(:,3);

XV = C(:,1);
YV = C(:,2);

% Matrix IN: 1 if in or on glacier, 0 otherwise
IN = inpolygon(X,Y,XV,YV);

    % Number of Data Points in cavity
    num = sum(IN);
    
    % Matrix containing elevation only if it is on the glacier
    X_IN = zeros(num,1);
    Y_IN = zeros(num,1);
    ELEV_IN = zeros(num,1);
    counter = 1;
    
    for i = 1:length(ELEV)
        if IN(i) == 1
            ELEV(i) = ELEV(i) + 5;
            SUM(counter) = X(i) + Y(i);
            counter = counter +1;
        end
    end
    
    Data = [X Y ELEV];
dlmwrite('BB_bed_cavity.dat',Data,'delimiter',' ','precision',14)