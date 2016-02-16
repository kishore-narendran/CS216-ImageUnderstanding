[ filters, labels ] = get_filter_bank();
neck = im2double(rgb2gray(imread('neck.jpg')));
leaves = im2double(rgb2gray(imread('leaves.jpg')));
grass = im2double(rgb2gray(imread('grass.jpg')));

patch_responses = cell(8,3);
patch_mar = zeros(8,3);
for i=1:8
    patch_responses{i,1} = abs(imfilter(neck, filters{i,1}));
    patch_mar(i,1) = mean2(patch_responses{i,1});
    patch_responses{i,2} = abs(imfilter(leaves, filters{i,1}));
    patch_mar(i,2) = mean2(patch_responses{i,2});
    patch_responses{i,3} = abs(imfilter(grass, filters{i,1}));
    patch_mar(i,3) = mean2(patch_responses{i,3});
end

figure;
bar(patch_mar);
legend 'Neck' 'Leaves' 'Grass';
title('Bar Graph of Mean Absolute Responses of Image Patches');
xlabel('Filter');
ylabel('Mean Absolute Response');
set(gca,'xticklabel',labels);
print('output/output3_3_bar', '-dpng');



