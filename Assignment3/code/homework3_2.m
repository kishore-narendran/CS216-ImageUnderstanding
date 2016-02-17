img = im2double(rgb2gray(imread('img1.jpg')));

% Finding the filtering of image using the derivative of a Gaussian
% in the x and y direction for different values of sigma
% Also returns the 2D Gaussian Filter
gauss_filt1 = derivative_of_gaussian(img, 1);
gauss_filt2 = derivative_of_gaussian(img, 2);
gauss_filt4 = derivative_of_gaussian(img, 4);


% Forming Center Surround Filters as a difference of two gaussian functions
center_surround_filter1 = gauss_filt2 - gauss_filt1;
center_surround_filter2 = gauss_filt4 - gauss_filt2;

% Displaying the result of using the center surround filter
img_cs1 = imfilter(img, center_surround_filter1);
img_cs2 = imfilter(img, center_surround_filter2);

figure;
subplot(1,2,1);
imagesc(center_surround_filter1);
colorbar;
colormap jet;
title('Center Surround Filter - 1');
subplot(1,2,2);
imagesc(center_surround_filter2);
colorbar;
colormap jet;
title('Center Surround Filter - 2');
print('output/output_3_2_csf_kernel', '-dpng');
close;

figure;
subplot(1,3,1);
imshow(img);
title('Grasycale Image');
subplot(1,3,2);
imshow(mat2gray(img_cs1));
title('Center Surround Filtered - 1');
subplot(1,3,3);
imshow(mat2gray(img_cs2));
title('Center Surround Filtered - 2');
print('output/output_3_2_csf', '-dpng');
close;
