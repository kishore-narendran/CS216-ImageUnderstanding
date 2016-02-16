function [ nnlabels ] = NNClassifier( tdata, data, labels )
    distances = dist2(data(:,:), tdata(:,:));
    [ distances, indices ] = min(distances);
    nnlabels(:) = labels(indices(:));
    nnlabels = nnlabels.';
end

