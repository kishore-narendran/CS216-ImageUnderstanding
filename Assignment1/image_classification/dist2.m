% Distance function provided by Dr. Charless Fowlkes
% For the purpose of NN classification of Images in the
% CIFAR-10 Image Dataset
function [ D ] = dist2( X,Y )
    m = size(X,1); 
    n = size(Y,1);
    X2 = sum(X.*X, 2);
    Y2 = sum(Y.*Y,2)';
    D = X2(:,ones(1,n)) + Y2(ones(1,m),:) - 2*X*Y';
end

