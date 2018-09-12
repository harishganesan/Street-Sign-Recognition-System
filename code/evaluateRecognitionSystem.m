function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
    
    predicted_labels = [];

    % we loop through each test image
    
    len = length(test_imagenames);
    for i = 1:len
        image = guessImage(strcat('../data/',test_imagenames{i})); % guess the image
        indexOfImage = find(strcmp(image, mapping)); % find index of that image within mapping
        predicted_labels(i) = indexOfImage; % add the index to our vector
    end
    
    predicted_labels = predicted_labels';

    % convert vector to confusion matrix
    
    [conf, order] = confusionmat(test_labels, predicted_labels); 
        

end