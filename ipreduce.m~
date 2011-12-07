function [ i ] = ipreduce( i, k )
%IPREDUCE Reduces the intensity levels of an image to 2^k
%   	The output intensity can be any power of 2 between
%       2 (k = 1) and 256 (k = 8).

img = im2double(i);         % convert image to double with range [0,1]
nr  = size(img,1);          % number of rows
nc  = size(img,2);          % number of columns

levels   = 2 ^ k;
interval = 1 / levels;       % delta in [0,1] to form 2^k levels

for r = 1:1:nr
    for c = 1:1:nc
       
        % pixel (r,c) is at the qth level
        q = min(floor(img(r,c) / interval), levels - 1);
        
        % map q from [0,levels-1] to 0-255
        i(r,c) = q * (256 / levels);           
        
    end
end

end

