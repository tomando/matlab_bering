% Nans to zeros

D = load('mesh.nodes');

for i = 1:length(D)
    if isnan(D(i,5))
        D(i,5) = 0;
    end
end

dlmwrite('mesh.nodes',D,'delimiter',' ','precision',14)
        