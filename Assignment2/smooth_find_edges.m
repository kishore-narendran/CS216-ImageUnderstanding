% Function that applies Gaussian Smoothing using a sigma value; and then
% finds the directional derivative along the x and y direction using the
% Sobel operator, and uses the results to find the magnitude and direction
% of edge and return them.
function [ edge_magnitude, edge_direction ] = smooth_find_edges( img, sigma )

    % Generating a Gaussian Filter of size 3x3
    % Wiht a sigma as specified by the input argument
    gaussian_filter = fspecial('gaussian', [5 5], sigma);
    
    % Smoothing image before finding horizontal and vertical derivatives
    img_smooth = conv2(img, gaussian_filter, 'same');

    % Using the Sobel operator to find the derivative in the 
    % Horizontal and vertical direction
    sobel_y = [ -1 -2 -1; 0 0 0; 1 2 1 ];
    sobel_x = [ -1 0 1; -2 0 2; -1 0 1 ];
    img_dx = conv2(img_smooth, sobel_x, 'same');
    img_dy = conv2(img_smooth, sobel_y, 'same');

    % Finding the edge direction and edge magnitudes
    edge_magnitude = (img_dx.^2 + img_dy.^2).^(0.5);
    edge_direction = atan(img_dy./img_dx);
end

