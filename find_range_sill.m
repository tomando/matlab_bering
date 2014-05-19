
function out = find_range_sill(var_struct)

h = var_struct.h;
g = var_struct.gam;

if length(h) <= 10
    trend = 3;
elseif length(h) <= 20
    trend = 4;
else
    trend = 5;
end

hh = h(1):0.01:h(end-1);
fil = fir1(20,.1);          % 20th order low pass filter
g = filtfilt(fil, 1, g);
g_ave = diff(g)./diff(h);
gg_ave = spline(h(1:end-1), g_ave, hh);


% Find all of the intersection points
i = 1;
flip = 1;
in = [];
in_main = [];

% This part starts by finding the first -ve slope point, it then iterates by finding each subsequent slope change after until it finds them all and stores them in 'in'.
while(1)
  if i == 1
    if isempty(find(flip*gg_ave < 0, 1))
        fprintf('break 1\n');
        break;
    end
    in(i) = find(flip*gg_ave < 0, 1);
  else
    if isempty(find(flip*gg_ave(in(i-1):end) < 0, 1))
        fprintf('break 2\n');
        break;
    end
    in(i) = find(flip*gg_ave(in(i-1):end) < 0, 1)+in(i-1);
  end
  i = i+1;
  flip = -flip;
end

% There are no slope change points. This could cause problems for a variogram that approaches a sill asymptotically (always a +ve slope, but becomes vanishingly small.
if isempty(in)      % Constantly increasing
    var_struct.range = h(end);
    var_struct.sill = g(end);
    fprintf(1, 'Warning: No sill reached, using full range.\n');
    
else                % Start checking cross-over points
    
    % Find the nearest points to the cross-over.
    for i = 1:length(in)
        [tmp in_main(i)] = min(abs(hh(in(i)) - h));
    end
    
    i = 1;
    while(1)
        % Check the i^th zero slope point
        g_trend = sign(diff(g(in_main(i):end)));
        counter = 0;
        type = '';
        
        % Check for trends after the range
        for j = 1:length(g_trend)-1
            if g_trend(j) == g_trend(j+1)
                counter = counter + 1;
                
                % An upward trend, move to the next zero point
                if counter == trend && g_trend(j) == 1 && ~isempty(find( abs((g(in_main(i)) - g(in_main(i):end))/g(in_main(i))) > var_struct.tol))
                    type = 'up';
                    i = i+1;
                    break;
                    
                % A downward trend, get out.
                elseif counter == trend && g_trend(j) == -1 && ~isempty(find( abs((g(in_main(i)) - g(in_main(i):end))/g(in_main(i))) > var_struct.tol))
                    type = 'down';
                    break;
                end
            end
        end
        
        if i > length(in_main) && strcmp(type, 'up')    % No sill reached
            var_struct.range    = h(end);
            var_struct.sill     = g(end);
            fprintf(1, 'Warning: No sill reached, using full range.\n');
            break;
        elseif strcmp(type, '')             % The current point is the sill
            var_struct.sill     = mean(g(in_main(i):end));
            in_range            = max(find(g(1:in_main(i)) - min(g) < (var_struct.sill-min(g))*.99));
            var_struct.range    = h(in_range);
            break;
        elseif strcmp(type,'down')          % Use points within x% for sill
            var_struct.range    = h(in_main(i));
            % Find the sill by taking the mean of the values within tol.
            var_struct.sill     = mean( g( find(abs((g(in_main(i)) - g(in_main(i):end))/g(in_main(i))) < var_struct.tol)+in_main(i)-1 ) );
            fprintf(1, 'Warning: The variogram has a downward trend\n');
            break;
        else                                % Updward trend but still more points to check
            ; 
        end
            
    end
        
end

out = var_struct;
