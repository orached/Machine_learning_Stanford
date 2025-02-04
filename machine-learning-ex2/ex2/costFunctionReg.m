function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

prediction = sigmoid(X*theta);
thetaExcludZero = theta(2:end);
%theta(1)=0;
regNumber = (lambda/(2*m)) * sum(thetaExcludZero.^2);
J = 1/m *(-y'*log(prediction)-(1-y)'*log(1-prediction))+regNumber;

%grad = 1/m * (X'*(prediction-y));

tX = X';
grad(1,1) = 1/m * (tX(1,1)*(prediction(1,1)-y(1,1)));
grad(2:end) = (1/m * (tX(2:end,2:end)*(prediction(2:end)-y(2:end)))) + lambda/m * thetaExcludZero;





% =============================================================

end
