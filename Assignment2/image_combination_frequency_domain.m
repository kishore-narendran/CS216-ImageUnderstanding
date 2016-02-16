function [ imgm1p2, imgm2p1 ] = image_combination_frequency_domain( img1, img2 )
    img1_freq = fft2(img1);
    img2_freq = fft2(img2);
    imgm1p2 = abs(img1_freq).*exp(i*angle(img2_freq));
    imgm2p1 = abs(img2_freq).*exp(i*angle(img1_freq));
    imgm1p2 = ifft2(imgm1p2);
    imgm2p1 = ifft2(imgm2p1);
end

