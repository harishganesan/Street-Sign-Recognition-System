function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('/Users/danielemanuelpuleio/Documents/MATLAB/final_project/data/traintest.mat');

	% TODO create train_features
    
    layerNum = 3; % number of spatial pyramids
    dictionarySize = size(dictionary,2); 
    K = 150;
    train_H = K*(4^3-1)/3; % Here we retrieve the size of the histogram
    train_length = length(train_imagenames); % Here we get the length of train imagenames
    train_features = zeros(train_H, train_length);
    % We loop throught train image names in order to retreieve each word wordMap
    for n=1:train_length
        wordMap = strrep(strcat('/Users/danielemanuelpuleio/Documents/MATLAB/final_project/data/',train_imagenames{n}),'.png','.mat');
        wordMap = load(wordMap);
        wordMap = wordMap.wordMap;
        % we get the wordMap values by indexing into wodMap object
        image_feature = getImageFeaturesSPM(layerNum, wordMap, dictionarySize); % returns image feature
        train_features(:,n) = image_feature; % append image feature to train_features
    end

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end