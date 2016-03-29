function [ patches, total_height, total_width ] = get_patches( images, NUMBER_OF_PATCHES_PER_IMAGE )
    NUMBER_OF_IMAGES = size(images,1);
    patches = cell(size(images,1) * NUMBER_OF_PATCHES_PER_IMAGE,1);
    index = 1;
    total_height = 0;
    total_width = 0;
    for i = 1:NUMBER_OF_IMAGES
        imshow(images{i,1});
        for j = 1:NUMBER_OF_PATCHES_PER_IMAGE
            rectangle = getrect();
            total_height = total_height + rectangle(1,4);
            total_width = total_width + rectangle(1,3);
            patches{index,1} = images{i,1}(rectangle(1,2):rectangle(1,2)+rectangle(1,4), rectangle(1,1):rectangle(1,1)+rectangle(1,3));
            index = index + 1;
        end
        close;
    end
end

