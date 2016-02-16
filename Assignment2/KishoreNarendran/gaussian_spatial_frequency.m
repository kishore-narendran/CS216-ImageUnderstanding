function gaussian_spatial_frequency( sigma )
    gauss_sig = fspecial('gaussian', [ 100 1 ], sigma);

    gauss_sig_freq = fft(gauss_sig);

    subplot(1,2,1);
    plot(gauss_sig);
    title(strcat('Gaussian Signal of \sigma=', int2str(sigma)));
    xlabel('Sample Number');
    ylabel('Magnitude');
    
    subplot(1,2,2);
    plot(abs(fftshift(gauss_sig_freq)));
    title(strcat('Magnitude Plot (Frequency Domain) Signal of \sigma=', int2str(sigma)));
    xlabel('Sample Number');
    ylabel('Magnitude');
end

