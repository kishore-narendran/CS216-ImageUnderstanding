function [ output_image ] = findAverageImage( image_list, average_flag, folder_name )
    if average_flag == 1
        output_image = zeros([215 300]);
    else
        output_image = zeros([215 300 3]);
    end
    
    for i = 1 : length(image_list)
        imgname = strcat(folder_name, image_list(i).name);
        img = imread(imgname);
        img = imresize(img, [215 300]);
        
        if average_flag == 1
            img = im2double(rgb2gray(img));
        elseif average_flag == 2
            img = im2double(img);
        elseif average_flag == 3
            img = probablyFlippedImage(im2double(img));
        end
        
        output_image = output_image + img;
    end
    
    output_image = output_image / length(image_list);
    
end

