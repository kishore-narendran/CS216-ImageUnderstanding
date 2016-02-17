[ filters, labels ] = get_filter_bank();
img = im2double(rgb2gray(imread('zebra.jpg')));
img_filtered = zeros(size(img,1), size(img,2), 8);
img_filtered_flattened = zeros(size(img,1)*size(img,2), 8);
for i=1:8
    img_filtered(:,:,i) = imfilter(img, filters{i,1});
    img_filtered_flattened(:,i) = reshape(img_filtered(:,:,i), [size(img,1)*size(img,2), 1]);
end

indexes = kmeans(img_filtered_flattened, 20, 'MaxIter', 1000);
figure;
indexes = reshape(indexes, [size(img, 1) size(img, 2)]);
imagesc(indexes);
title('Textons Visualization - After Clustering using Filterbank Responses');
colorbar;
colormap jet;
print('output/output3_4_texton (14)', '-dpng');
close;
