% Filename: exp_vario.m
% Author:   Maciej Stachura
% Date:     April 21, 2008
% Purpose:  Compute either the global or directional variogram from data.
%
% Inputs:   [(x,z), h, bin_size, direction, angular_bin]
%           (Note that direction and angular are only used for a
%           directional variogram and must be in radians.)
%
% Outputs:  [gam]
%           (The experimental variogram)

function gam_out = exp_vario(data, h, h_bin, dir, dir_bin)

x = data(:,1:end-1);
z = data(:,end);

if nargin == 3      % Global Variogram
    
    gam = zeros(length(h), 2);
    while size(x,1) > 1
        
        % Compute the distances
        len = zeros(1,size(x,1));
        vec_diff = ones(size(x,1),1)*x(1,:) - x;
        for i = 1:size(vec_diff,1);
            len(i) = norm(vec_diff(i,:));
        end
        
        % Compute the variogram
        for j = 1:length(h)        
            in = find(len<h(j)+h_bin & len>h(j)-h_bin);
            for i = 1:length(in)
                gam(j,1) = gam(j,1) + ( z(in(i)) - z(1) )^2;
                gam(j,2) = gam(j,2) + 1;
            end
        end
        
        x = x(2:end,:);
        z = z(2:end);
    end
    
    gam_out = 1/2*gam(:,1)./gam(:,2);


elseif nargin == 5  % Directional Variogram
    fprintf(1, 'Directional not written yet');
else
    fprintf(1, 'Error: Incorrect number of inputs to exp_vario\n');
end
