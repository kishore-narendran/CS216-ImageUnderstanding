function [ output_image ] = probablyFlippedImage( image )
    randomNumber = randi(2);
    if randomNumber == 1
        output_image = image(:,end:-1:1,:);
    else
        output_image = image;
    end
end

