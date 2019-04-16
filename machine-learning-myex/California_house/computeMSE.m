function [MSE] = computeMSE(prediction, observed)

%计算均方误差

n = size(prediction, 1);
tmp = prediction-observed
MSE = (1/n) * sum((prediction-observed).^2);

fprintf('the MSE:  %f \n', MSE);

end
