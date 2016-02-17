function [ quantized_image ] = color_quantization_indexes ( img, k )
    % Making vectors out of the R, G and B values
    img_r = reshape(img(:,:,1), [size(img,1)*size(img,2), 1]);
    img_g = reshape(img(:,:,2), [size(img,1)*size(img,2), 1]);
    img_b = reshape(img(:,:,3), [size(img,1)*size(img,2), 1]);
    
    % Performing k means clustering
    indexes = kmeans([img_r img_g img_b], k);
    
    % Reshaping the indices and forming the image, using the centroid
    % colors
    quantized_image = reshape(indexes, [size(img, 1) size(img, 2)]);
end

