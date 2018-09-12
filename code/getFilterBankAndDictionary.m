function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    % TODO Implement your code here
    
    filterBank  = createFilterBank();
    
    K = 150;
    a = 50;
    
    total_images = length(imPaths);
    
    aTx3F = zeros(a*total_images,60); % matrix of alpha * training size by filterResponses per channel
    j = 1;
    for n = 1:total_images
        path = imPaths{n} % get path of image
        I = imread(path);
        filterResponses = extractFilterResponses(I, filterBank); % retrieve responses for that image
        random_cols = randperm(size(I,1),a); % get row vector of randomized values of size alpha
        random_rows = randperm(size(I,2),a); % same for column values
        for i = 1:a
            % then we retrieve filter responses of random pixels using row/col vectors of random values
            responses = filterResponses(random_cols(i),random_rows(i),:); 
            aTx3F(j,:) = responses; % add to 2D matrix 
            j = j + 1;
        end
    end
    
    [~, dictionary] = kmeans(aTx3F, K, 'EmptyAction','drop'); % retrieve dictionary 
    dictionary = dictionary'; % transpose dictionary for pdist2 function
    
end
