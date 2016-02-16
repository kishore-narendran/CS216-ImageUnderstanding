function [ ] = image_combination_plot( image1_path, image2_path )
    img1 = im2double(rgb2gray(imread(image1_path)));
    img2 = im2double(rgb2gray(imread(image2_path)));
    [ m1p2, m2p1 ] = image_combination_frequency_domain( img1, img2 );

    subplot(2,2,1);
    imshow(img1);
    title('Image 1');

    subplot(2,2,2);
    imshow(img2);
    title('Image 2');

    subplot(2,2,3);
    imshow(m1p2);
    title('Magnitude of Image 1, Phase of Image 2');

    subplot(2,2,4);
    imshow(m2p1);
    title('Phase of Image 1, Magnitude of Image 2');
end

