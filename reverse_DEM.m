% Reverse order of DEM
% acending y and x
% Thomas Trantow


function R = reverse_DEM(filename)
    S = load(filename);
    
    [d,IA1,IC1] = unique(S(:,1));
    [e,IA2,IC2] = unique(S(:,2));
    l = length(d);
    k = length(e);
    last = flipud(IA2);
    at = 1;
    % Flip each blocks in S for fixed y
    for j = 1:k
           
       A = S(at:last(j),:);
       F = flipud(A);
       S(at:last(j),:) = F;
       
       at = last(j) +1;
            
    end
    
    % One final flip
    R = flipud(S);

end


