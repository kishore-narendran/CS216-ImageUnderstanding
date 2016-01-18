function [ image_data, image_labels, test_data, test_labels ] = prepare_data( )
    load('cifar10/data_batch_1.mat');
    image_data = double(data);
    image_labels = double(labels);
    for i = 2:5
        load(strcat('cifar10/data_batch_',int2str(i), '.mat'));
        image_data = vertcat(image_data, double(data));
        image_labels = vertcat(image_labels, double(labels));
    end
    load('cifar10/test_batch.mat');
    test_data = double(data);
    test_labels = double(labels);
end

