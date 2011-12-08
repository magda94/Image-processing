function [ i ] = ipresizebl( i, sx, sy)
%IPRESIZEBL Zooming by bilineair interpolation
%       Capable of zooming and shrinking an image by bi-linear
%       interpolation. The input to the function are the scaling 
%       factors in the x- and y-dimensions, where x = y = 1.0 
%       represents no scaling.

A  = im2double(i);    % convert image to double with domain [0,1]
sr = size(A,1);       % source number of rows
sc = size(A,2);       % source number of columns

tr = ceil(sr * sy);  % target image number of rows  
tc = ceil(sc * sx);  % target image number of columns

dx = (sc - 1) / (tc - 1);    % spread of pixels in x direction
dy = (sr - 1) / (tr - 1);    % spread of pixels in y direction

% starting at (1,1) we distribute A over B and interpolate intermediate
% pixels using weighted bilineair interpolation. 

    % TODO: http://tech-algorithm.com/articles/bilinear-image-scaling/
    % create target image
    B = zeros(tr,tc);
    
    % Loop. If (x,y) not at a source pixel, then interpolate
    for x = 1:1:tr
        for y = 1:1:tc
            
            % find 'pixel' in (sx,sy), starting at 1,1
            sx = 1 + dy * (x - 1);
            sy = 1 + dx * (y - 1);
            
            % = 1 + dy * 560. 
            % find surrounding 4 pixels based on dx,dy
            tl = A(floor(sx),floor(sy));
            tr = A(floor(sx),ceil(sy));
            bl = A(ceil(sx),floor(sy));
            br = A(ceil(sx),ceil(sy));
            
            % Y = A(1-w)(1-h) + B(w)(1-h) + C(h)(1-w) + Dwh
            offset_x = sx - floor(sx);
            offset_y = sy - floor(sy);
            
            B(x,y) = tl * (1 - offset_x) * (1 - offset_y) ...
                   + tr * offset_x * (1 - offset_y) ...
                   + bl * (1 - offset_x) * offset_y ...
                   + br * offset_x * offset_y;
        end
    end
    
i = im2uint8(B);                        % convert to 8-bit

end