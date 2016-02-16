% Script to find average of images in a set

% Change the folder_name variable, to the path of the folder with the set
% of images. This will change the set of images on which the average will
% be performed.
% For example, if the set of image is in folder 'set2/'.
% Then change the following commmand to folder_name = 'set2/'

folder_name = 'set2/';

% Generating the list of image names in the folder of images to average
image_list = dir(strcat(folder_name, '*.jpg')); 

% This flag determines which mode of averaging to perform
% 1 - Averaging the Grayscale of the image
% 2 - Averaging the RGB channels of the image
% 3 - Avergaing the images with random mirror images
% For example, set average_flag = 2 for averaging in RGB
average_flag = 3;

% Forming a figure with the three diffent kind of average images
subplot(1,3,1);
average_flag = 1;
output = findAverageImage(image_list, average_flag, folder_name);
imshow(output);
title('Grayscale Average');

subplot(1,3,2);
average_flag = 2;
output = findAverageImage(image_list, average_flag, folder_name);
imshow(output);
title('RGB Average');

subplot(1,3,3);
average_flag = 3;
output = findAverageImage(image_list, average_flag, folder_name);
imshow(output);
title('Random Mirror-Flips Average');

print(strcat('results/',folder_name(1:end-1),'average'), '-djpeg'); 
