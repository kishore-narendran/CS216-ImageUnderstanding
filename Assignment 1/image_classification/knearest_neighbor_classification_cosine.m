% Loading all the training data and testing data into workspace
[ data, labels, tdata, tlabels ] = prepare_data();
load('cifar10/batches.meta.mat');

% Finding k Nearest Neighbors 
% For k values 1,3,5

kvalues = [1 3 5 7 9];
cos_average_classification_rate = zeros([max(kvalues) 1]);
cos_knnlabels_collection = cell([max(kvalues) 1]);
cosknnlabels = KNNClassifier(tdata,data,labels,max(kvalues),1);
for i = 1:size(kvalues,2)
    k = kvalues(i);
    if i ~= 1
        cos_knnlabels_collection{k} = mode(cosknnlabels(1:k,:)).';
        cos_average_classification_rate(k,1) = size(find(cos_knnlabels_collection{k}(:,1)==tlabels(:,1)),1)/size(tdata,1);
    else
        cos_knnlabels_collection{k} = cosknnlabels(1:i,:).';
        cos_average_classification_rate(k,1) = size(find(cos_knnlabels_collection{k}(:,1)==tlabels(:,1)),1)/size(tdata,1);
    end
end

% Finding the k for which classification matrix is the maximum
% Displaying the confusion matrix of the best kNN Classification
% With Cosine Similarity Distance Function

[ cos_max_acr, cos_max_acr_index ] = max(cos_average_classification_rate);
cos_cc_matrix = find_class_confusion_matrix(cos_knnlabels_collection{cos_max_acr_index}, tlabels);
imagesc(cos_cc_matrix);
xlabel('Acatual Label');
ylabel('Predicted Label');
title(strcat('Class Confusion Matrix of ', int2str(cos_max_acr_index), ' neighbor NN Classification using Cosine Similarity'));
disp('Lowest Average Classification Rate k is');
disp(cos_max_acr_index);
disp('The Average Misclassification Rate is');
disp(1 - cos_max_acr);
colorbar;
colormap jet;



