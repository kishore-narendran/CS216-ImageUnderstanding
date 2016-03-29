function [magnitude,orientation] = mygradient(img)
    % Using the Sobel operator to find the derivative in the 
    % Horizontal and vertical direction
    central_difference_y = [ -1; 0; 1 ];
    central_difference_x = [ -1 0 1];
    img_dx = imfilter(img, central_difference_x, 'same');
    img_dy = imfilter(img, central_difference_y, 'same');

    % Finding the edge direction and edge magnitudes
    magnitude = (img_dx.^2 + img_dy.^2).^(0.5);
    orientation = atan(img_dy./img_dx);
end

