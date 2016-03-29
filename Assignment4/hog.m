function [ ohist ] = hog(img)

    % Defining number of bins
    number_of_bins = 9;
    
    % Finding gradient magnitude and orientation of the image
    [ magnitude, orientation ] = mygradient(img);
    mag_threshold = 0.1*max(magnitude(:));
    ohist = zeros([ceil(size(img)/8) number_of_bins]);
    
    % Finding the histogram of oriented gradients
    for i = 1:number_of_bins
        lower = -pi/2 + (i-1) * pi/9;
        upper = -pi/2 + i * pi/9;
        % Finding all the pixels that satisfy the bin and the magnitude
        % requirements
        B = magnitude > mag_threshold &...
            orientation >= lower &...
            orientation < upper;
        B = im2col(B,[8 8],'distinct');
        ohist(:,:,i) = reshape(sum(B), ceil(size(img)/8));
    end

    % Normalizing the oriented histogram
    for i = 1:size(ohist,1)
        for j = 1:size(ohist,2)
            if sum(ohist(i,j,:)) ~= 0
                ohist(i,j,:) = ohist(i,j,:)./sum(ohist(i,j,:));
            end
        end
    end
end



