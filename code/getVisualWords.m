function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    % img = imread('../data/mountain/sun_adgqqjvuzvxmxapa.jpg');
    width = size(img,1);
    height = size(img,2);
    dim = width * height;
    filterResponses = extractFilterResponses(img,filterBank);
    filterResponses = reshape(filterResponses, dim, size(filterResponses,3));
    trans_dict = dictionary';
    d = pdist2(trans_dict, filterResponses, 'euclidean', 'smallest',1);
    d = reshape(d,width,height);
    wordMap = d;
    

end
