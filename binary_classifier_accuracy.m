function [accuracy, mistakes, p] = binary_classifier_accuracy(data, theta)
% Given a dataset (either train or test) and a parameter vector theta,
% uses theta to predict the labels on the images data.X and compares with
% the given labels data.y. Returns the fraction of correct predictions and
% the id's of incorrectly predicted labels. The vector p has one entry for
% each image in data.X, with value giving the probability that the image is
% a 1, according to theta.

    X = data.X;
    y = data.y;

    sigmoid = @(z) 1./(1+exp(-z));
    
    % probabilities of images being 1's
    p = sigmoid(X'*theta);
    
    mistakes = find(y ~= (p >= 0.5));
    
    n_correct = length(y) - length(mistakes);
    
    accuracy = n_correct / length(y);
    
end
