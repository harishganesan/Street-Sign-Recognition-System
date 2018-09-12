function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here

    
    
    filterResponses = [];

    % We create filterResponses vector 

    if(size(img,3) < 3) % incase its grayscale we simply duplicate each RGB 
        img(:,:,2) = img(:,:,1);
        img(:,:,3) = img(:,:,1);
    end
    img = RGB2Lab(img); % image goes to LAB space
    for n=1:20
        imageFilter = imfilter(img, filterBank{n, 1}); % apply the nth filter to image 
        filterResponses4D(:,:,:,n) = imageFilter; % input it into 4D matrix
        filterResponses = cat(3, imageFilter, filterResponses); % convert that 4D matrix to 3D
    end
    
end
