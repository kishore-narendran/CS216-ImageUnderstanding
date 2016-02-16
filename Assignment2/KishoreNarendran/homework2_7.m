% Reading image and converting to grascale
img = im2double(rgb2gray(imread('img1.jpg')));

% Smoothing and finding the edges using a sigma value of 1 for gaussian
% smoothing before applying gradient derivative filter i.e. the Sobel
% operator.
[ edge_magnitude, edge_direction ] = smooth_find_edges(img, 1);
subplot(2,2,1);
imshow(edge_magnitude);
title('Edge Magnitude with \sigma=1');
subplot(2,2,2);
imshow(edge_direction);
title('Edge Orientation with \sigma=1');

% Smoothing and finding the edges using sigma value of 2 for gaussian
% smoothing before applying the gradient dericative filter i.e. the Sobel
% operator.
[ edge_magnitude, edge_direction ] = smooth_find_edges(img, 2);
subplot(2,2,3);
imshow(edge_magnitude);
title('Edge Magnitude with \sigma=2');
subplot(2,2,4);
imshow(edge_direction);
title('Edge Orientation with \sigma=2');

