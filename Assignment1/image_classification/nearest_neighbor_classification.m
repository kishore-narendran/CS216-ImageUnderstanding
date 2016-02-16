% Loading all the training data and testing data into workspace
[ data, labels, tdata, tlabels ] = prepare_data();
load('cifar10/batches.meta.mat');

% Simple Nearest Neighbour Classification of Images
nnlabels = NNClassifier(tdata,data,labels);

% Finding and displaying the class confusion matrix

cc_matrix = find_class_confusion_matrix(nnlabels, tlabels);
imagesc(cc_matrix);
xlabel('Actual Label');
ylabel('Predicted Label');
title('Class Confusion Matrix for Nearest Neighbor Classifier');
colorbar;
colormap jet;
pause;

% Finding and displaying the average classification rate
average_classification_rate = size(find(nnlabels(:,1)==tlabels(:,1)),1)...
     /size(tdata,1);
disp('Average Classification Rate for NN Classifier is');
disp(average_classification_rate);