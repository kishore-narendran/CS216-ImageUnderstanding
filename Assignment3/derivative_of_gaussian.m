function [ gauss_filt ] = derivative_of_gaussian( img, sigma )
    gauss_filt = fspecial('gaussian', [ 5 5 ], sigma);
    [ gauss_filtx, gauss_filty ] = gradient(gauss_filt);

    figure;
    subplot(1,2,1);
    imagesc(gauss_filtx);
    title(strcat('2D Gaussian - Horizontal - \sigma=', int2str(sigma)));
    colorbar;
    colormap jet;
    subplot(1,2,2);
    imagesc(gauss_filty);
    title(strcat('2D Gaussian - Vertical - \sigma=', int2str(sigma)));
    colorbar;
    colormap jet;
    print(strcat('output/output3_2_','filter_kernel_',int2str(sigma)), '-dpng');
    close;
    
    img_gfx = imfilter(img, gauss_filtx);
    img_gfy = imfilter(img, gauss_filty);
    
    figure;
    subplot(1,3,1);
    imshow(img);
    title('Grayscale Image');
    subplot(1,3,2);
    imshow(img_gfx);
    title(strcat('Horizontal Gaussian \sigma=', int2str(sigma)));
    subplot(1,3,3);
    imshow(img_gfy);
    title(strcat('Vertical Gaussian \sigma=', int2str(sigma)));
    print(strcat('output/output3_2_','gauss_sig',int2str(sigma)), '-dpng');
    close;
end

