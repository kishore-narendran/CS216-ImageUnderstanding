function [ signal, signal_freq ] = box_signal( width, size_of_signal )
    if mod(width,2) == 1
        box = zeros([(size_of_signal + 1) 1]);
        box(((size_of_signal/2) + 1)-((width-1)/2):((size_of_signal/2) + 1)+((width-1)/2)) = 1;
    else
        box = zeros([size_of_signal 1]);
        box((size_of_signal/2)-(width/2):(size_of_signal/2)+(width/2)) = 1;
    end
    signal = box;
    signal_freq = fft(box);
end

