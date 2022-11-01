clear;
close all;
clc;

% Load the data (both train and test sets, and value of n = 785)
load mnist_train_test.mat;

%%  Define the cost function f (question 7)

lambda = 1e-4;
% The following is special about MATLAB syntax: fhandle is a handle for a
% function that takes one input (theta) and is equivalent to calling
% logistic_regression(train, theta, lambda). In this way the input 'train'
% is fixed once and for all.
fhandle = @(theta) logistic_regression(train, theta, lambda);

%% Check the gradient (question 8)

% Generate a random point and a random direction

theta = randn(d, 1);
v = randn(d, 1);
v = v/norm(v);

% Check the Taylor expansion for that point and that direction
checkgradient(fhandle, theta, v);

%% Lipschitz constant (question 9)

% Set the Lipschitz constant
L = max(max(train.X))^2/4;

%% Gradient descent with constant step sizes (question 10)

% Examples of parameters that your algorithm can take.
params.maxiters = 30000;
params.maxtime = 3 * 60;
% Tolerance on the gradient norm. Stop the algorithm if the gradient norm
% has decreased by a factor of tolgradnorm (compared to the initial
% gradient norm).
params.tolgradnorm = 5e-4;
params.verbose = false; % Whether or not the algorithm should print information when it is running

% Step size
alpha = 1/L;

% Initial point
theta0 = randn(d,1)* 20;

[csttheta, cstgradnorms, csttimes] = cstgradientdescent(fhandle, theta0, alpha, params);

%% Plot results (question 11)

semilogy(cstgradnorms);

%% Gradient descent with backtracking linesearch (question 13)

% Parameters for the main loop
params.maxiters = 30000;
params.maxtime = 3 * 60;
params.tolgradnorm = 1e-5;
params.verbose = false;

% Examples of parameters for the linesearch
lsparams.alphabar = 1;
lsparams.c = 1e-4;
lsparams.rho = 0.8;
lsparams.alphamin = 1e-8;

% Initial point
theta0 = randn(d,1)* 20;

% Run gradient descent with linesearch
[lstheta, lsgradnorms, lstimes] = lsgradientdescent(fhandle, theta0, params, lsparams); ...

% Plot results
semilogy(lsgradnorms);

% ... Modify also to run with multiple starting points and visualize the
% gradient norm against number of calls to f in semilogy. ...

%% Gradient norm versus time (question 14)

hold on
semilogy(csttimes, cstgradnorms);
semilogy(lstimes, lsgradnorms);
hold off

%% Show image in a grayscale figure (question 15)

theta = csttheta;
showMNISTImage(theta)

%% Assess quality of the model (question 16)

theta = csttheta;

% Evaluate quality of classifier vector theta
[accuracy_train, mistakes_train, p_train] = binary_classifier_accuracy(train, theta);
[accuracy_test, mistakes_test, p_test] = binary_classifier_accuracy(test, theta);

fprintf('Accuracy\n  Train: %.6g\n  Test:  %.6g\n', accuracy_train, accuracy_test);

% Show images that caused trouble
if ~isempty(mistakes_train)
    showMNISTImages_many(train.X(:, mistakes_train));
    title('Failed train images');
    disp(p_train(mistakes_train));
end
if ~isempty(mistakes_test)
    showMNISTImages_many(test.X(:, mistakes_test));
    title('Failed test images');
    disp(p_test(mistakes_test));
end
