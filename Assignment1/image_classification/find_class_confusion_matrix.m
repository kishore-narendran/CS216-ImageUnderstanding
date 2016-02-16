function [ confusion_matrix ] = find_class_confusion_matrix( predicted_labels, actual_labels )
    confusion_matrix = zeros(10);
    for i = 1:10000
        confusion_matrix(actual_labels(i,1) + 1, predicted_labels(i,1) + 1) = confusion_matrix(actual_labels(i,1) + 1, predicted_labels(i,1) + 1) + 1; 
    end
    confusion_matrix = confusion_matrix./1000;
end

