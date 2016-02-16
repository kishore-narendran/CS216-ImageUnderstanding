function [ ] = signal_spatial_frequency( width, size )
    [ box, box_freq ] = box_signal(width,size);
    subplot(1,2,1);
    plot(box); 
    if width == 1
        title('Impulse Signal');
    else
        title(strcat('Box Signal of Width=', int2str(width)));
    end
    
    xlabel('Sample Number');
    ylabel('Magnitude');
    xlim([0 100]);

    subplot(1,2,2);
    plot(abs(fftshift(box_freq)));
    title('Magnitude Plot of Box Signal in Frequency Domain');
    xlabel('Sample Number');
    ylabel('Magnitude');
    xlim([0 100]);
end

