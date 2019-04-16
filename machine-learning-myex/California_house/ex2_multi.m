%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

addpath("../");

data_filename="california_housing_test.csv";


%% Load Data
data = csvread(data_filename);

% 训练特征种类

N = size(data, 2);
M = size(data, 1);

training_samples_size=ceil((2/3)*M);
observed_samples_size=M-training_samples_size;


training_samples=data(1:training_samples_size, 1:N-1);
training_result=data(1:training_samples_size, N);

observed_samples=data(training_samples_size+1:M, 1:N-1);
observed_result=data(training_samples_size+1:M, N);




X = training_samples;
y = training_result;
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

X_normal = X;

[X_normal mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];
X_normal = [ones(m, 1) X_normal];


fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(N, 1);
[theta, J_history] = gradientDescentMulti(X_normal, y, theta, alpha, num_iters);


% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.

m=length(observed_result);

prediction1 = observed_samples;
prediction1 = (prediction1-mu) ./ sigma;
prediction1 = [ones(m,1) prediction1];

price=prediction1 * theta;
price
computeMSE(price, observed_result);

% % ============================================================

% fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
%          '(using gradient descent):\n $%f\n'], price);

% fprintf('Program paused. Press enter to continue.\n');
% pause;

% %% ================ Part 3: Normal Equations ================

% fprintf('Solving with normal equations...\n');

% % ====================== YOUR CODE HERE ======================
% % Instructions: The following code computes the closed form 
% %               solution for linear regression using the normal
% %               equations. You should complete the code in 
% %               normalEqn.m
% %
% %               After doing so, you should complete this code 
% %               to predict the price of a 1650 sq-ft, 3 br house.
% %

% %% Load Data
% % data = csvread('ex1data2.txt');
% % X = data(:, 1:2);
% % y = data(:, 3);
% % m = length(y);

% % % Add intercept term to X
% % X = [ones(m, 1) X];

% % Calculate the parameters from the normal equation
% theta = normalEqn(X, y);

% % Display normal equation's result
% fprintf('Theta computed from the normal equations: \n');
% fprintf(' %f \n', theta);
% fprintf('\n');


% % Estimate the price of a 1650 sq-ft, 3 br house
% % ====================== YOUR CODE HERE ======================
% price = 0; % You should change this
% price=[1, 1650, 3] * theta;

% % ============================================================

% fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
%          '(using normal equations):\n $%f\n'], price);

