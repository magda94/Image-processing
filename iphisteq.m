function [ img ] = iphisteq( img )
%IPHISTEQ Summary of this function goes here
%   Detailed explanation goes here

% Image-size and histogram
nr = size(img, 1);
nc = size(img, 2);
pr = iphistogram(img);
sk = zeros(1,256);

% Calculate transformation mapping by summation
sk(1) = pr(1);
for x = 2:1:256
    sk(x) = sk(x - 1) + pr(x);
end

% Tranform image
for x = 1:1:nc
    for y = 1:1:nr
        intlvl = img(y,x) + 1;
        img(y,x) = 256 * sk(intlvl);
    end
end

end

