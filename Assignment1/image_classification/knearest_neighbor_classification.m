% Loading all the training data and testing data into workspace
[ data, labels, tdata, tlabels ] = prepare_data();
load('cifar10/batches.meta.mat');

% Finding k Nearest Neighbors 
% For k values 1,3,5

kvalues = [1 3 5];
average_classification_rate = zeros([max(kvalues) 1]);
knnlabels_collection = cell([max(kvalues) 1]);
knnlabels = KNNClassifier(tdata,data,labels,max(kvalues),2);
for i = 1:size(kvalues,2)
    k = kvalues(i);
    if i ~= 1
        knnlabels_collection{k} = mode(knnlabels(1:k,:)).';
        average_classification_rate(k,1) = size(find(knnlabels_collection{k}(:,1)==tlabels(:,1)),1)/size(tdata,1);
    else
        knnlabels_collection{k} = knnlabels(1:i,:).';
        average_classification_rate(k,1) = size(find(knnlabels_collection{k}(:,1)==tlabels(:,1)),1)/size(tdata,1);
    end
end

% Finding the k for which classification matrix is the maximum
% Displaying the confusion matrix of the best kNN Classification

[ max_acr, max_acr_index ] = max(average_classification_rate);
cc_matrix = find_class_confusion_matrix(knnlabels_collection{max_acr_index}, tlabels);
imagesc(cc_matrix);
xlabel('Actual Labels');
ylabel('Predicted Labels');
title(strcat('Class Confusion Matrix for KNN classifier with k = ', int2str(max_acr_index)));
disp('Highest Average Classification Rate k is');
disp(max_acr_index);
disp('The Average Mislassification Rate is');
disp(1 - max_acr);
colorbar;
colormap jet;