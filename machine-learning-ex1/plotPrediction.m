function plotPrediction(X, y, thetas)

figure;


plot(X(:,2), y, '.', 'MarkerSize', 15);

hold on;

m = length(thetas);


for iter = 1 : 3 
    prediction = X * (thetas(iter,:))';

    plot(X(:,2), prediction);
    pause(0.001);
    
end
%pause(10);