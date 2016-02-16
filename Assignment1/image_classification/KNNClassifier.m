function [ knnlabels ] = KNNClassifier( tdata, data, labels, k, cosine_flag )
    if cosine_flag == 1        
        distances = pdist2(data(:,:), tdata(:,:), 'cosine');
    else
        distances = dist2(data(:,:), tdata(:,:));
    end
    [sorted_distances, indices] = sort(distances);
    k_indices = indices(1:k,:);
    knnlabels(:,:) = labels(k_indices(:,:));
%     nnlabels_repeat = nnlabels;
%     % Finding most frequent label
%     [ nnlabels, f, c ] = mode(nnlabels,2);
%     
%     % If there is a tie in the mode then the closest neighbor is chosen
%     for i = 1:size(c,1)
%         if size(c(i,:), 1) >= 1
%             nnlabels(i,1) = nnlabels_repeat(i,1);
%         end
%     end
end


