% Loading all the training data and testing data into workspace
[ data, labels, tdata, tlabels ] = prepare_data();
load('cifar10/batches.meta.mat');


% Displaying the first image in the data set
image = [];
firstAirplaneImage = find(tlabels==0,1);
image(:,:,1) = reshape(tdata(firstAirplaneImage,1:1024),[32 32])';
image(:,:,2) = reshape(tdata(firstAirplaneImage,1025:2048), [32 32])';
image(:,:,3) = reshape(tdata(firstAirplaneImage,2049:3072), [32 32])';
imshow(uint8(image));