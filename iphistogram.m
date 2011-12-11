function [ hist ] = iphistogram( img )
%IPHISTOGRAM yields a histogram of an 8-bit grayscale image
%       The output is normalized wrt the number of pixels in the source
%       image.
% 

nr  = size(img,1);  % number of rows
nc  = size(img,2);  % number of columns
hist = zeros(1,256);  % result placeholder
frac = 1 / (nr * nc); % weight of 1 pixel

for x = 1:1:nc
    for y = 1:1:nr
        intlvl = img(y,x) + 1;              % map 0-255 to 1-256
        hist(intlvl) = hist(intlvl) + frac;
    end
end

end

