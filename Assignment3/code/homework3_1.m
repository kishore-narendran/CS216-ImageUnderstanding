img = im2double(imread('img3.jpg'));

img_k2 = color_quantization(img, 2);
img_k5 = color_quantization(img, 5);
img_k10 = color_quantization(img, 10);

subplot(3,2,1)
imshow(img_k2);
title('k Means Clusering with k = 2');

subplot(3,2,3);
imshow(img_k5);
title('k Means Clusering with k = 5');


subplot(3,2,5);
imshow(img_k10);
title('k Means Clusering with k = 10');

img_scaled_red = img;
img_scaled_red(:,:,1) = img_scaled_red(:,:,1).*1000;

img_k2_sr = color_quantization(img_scaled_red, 2);
img_k5_sr = color_quantization(img_scaled_red, 5);
img_k10_sr = color_quantization(img_scaled_red, 10);

img_k2_sr(:,:,1) = img_k2_sr(:,:,1)./1000;
img_k5_sr(:,:,1) = img_k5_sr(:,:,1)./1000;
img_k10_sr(:,:,1) = img_k10_sr(:,:,1)./1000;

subplot(3,2,2)
imshow(img_k2_sr);
title('k Means Clusering of RGB with k = 2 (Scaled Red)');

subplot(3,2,4);
imshow(img_k5_sr);
title('k Means Clusering of RGB with k = 5 (Scaled Red)');

subplot(3,2,6);
imshow(img_k10_sr);
title('k Means Clusering of RGB with k = 10 (Scaled Red)');
print('output/output3_1', '-dpng');
close;




