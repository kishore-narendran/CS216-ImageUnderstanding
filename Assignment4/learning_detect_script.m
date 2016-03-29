NUMBER_OF_POSITIVE_EXAMPLES = 5;
NUMBER_OF_NEGATIVE_EXAMPLES = 100;
NUMBER_OF_IMAGES = 5;

% Loading training images
training_images = cell(NUMBER_OF_IMAGES,1);
for i = 1:NUMBER_OF_IMAGES
    training_images{i,1} = im2double(rgb2gray(imread(strcat('images/test' + int2str(i-1) + 'test.jpg'))));
end

% Getting the positive and negative training examples
% Done using the get_patches.m function
[ positive_examples, positive_total_height, positive_total_width ] = ...
    get_patches(training_images, NUMBER_OF_POSITIVE_EXAMPLES / NUMBER_OF_IMAGES);
[ negative_examples, negative_total_height, negative_total_width ] = ...
    get_patches(training_images, NUMBER_OF_NEGATIVE_EXAMPLES / NUMBER_OF_IMAGES);

% Finding the average size of the template
average_height = round(( positive_total_height + negative_total_height ) /...
    (NUMBER_OF_POSITIVE_EXAMPLES + NUMBER_OF_NEGATIVE_EXAMPLES) / 8) * 8;
average_width = round(( positive_total_width + negative_total_width ) /...
    (NUMBER_OF_POSITIVE_EXAMPLES + NUMBER_OF_NEGATIVE_EXAMPLES) / 8) * 8;
average_size = [ average_height average_width ];
clear positive_total_height negative_total_height...
    positive_total_width negative_total_width average_height average_width;


% Resizing all the positive and negative training example templates and
% finding their Histogram of GRadients, using hog.m
positive_examples_hog = cell(NUMBER_OF_POSITIVE_EXAMPLES, 1);
negative_examples_hog = cell(NUMBER_OF_NEGATIVE_EXAMPLES, 1);
average_positive_hog = zeros([average_size/8 9]);
average_negative_hog = zeros([average_size/8 9]);
for i = 1:NUMBER_OF_POSITIVE_EXAMPLES
    positive_examples{i, 1} = imresize(positive_examples{i,1}, average_size);
    positive_examples_hog{i,1} = hog(positive_examples{i,1});
    average_positive_hog = average_positive_hog + positive_examples_hog{i,1};
end

for i = 1:NUMBER_OF_NEGATIVE_EXAMPLES
    negative_examples{i, 1} = imresize(negative_examples{i,1}, average_size);
    negative_examples_hog{i,1} = hog(negative_examples{i,1});
    average_negative_hog = average_negative_hog + negative_examples_hog{i,1};
end

average_positive_hog = average_positive_hog / NUMBER_OF_POSITIVE_EXAMPLES;
average_negative_hog = average_negative_hog / NUMBER_OF_NEGATIVE_EXAMPLES;

final_template = average_positive_hog - average_negative_hog;
% final_template = average_positive_hog;

% Loading the test image
testing_image= im2double(rgb2gray(imread('images/test6.jpg')));


% Finding n detections in the test image
number_of_detections = 5;
[ x, y, score ] = detect(testing_image, final_template, number_of_detections);
[ x_multi, y_multi, score_multi ] = multiscale_detect(testing_image, final_template, number_of_detections);


% Visualizing top number_of_detections detections
figure(3); clf; imshow(testing_image);
for i = 1:number_of_detections
  % draw a rectangle.  use color to encode confidence of detection
  %  top scoring are green, fading to red
  hold on; 
  h = rectangle('Position',[x(i)-64 y(i)-64 128 128],'EdgeColor',[(i/number_of_detections) ((number_of_detections-i)/number_of_detections)  0],'LineWidth',3,'Curvature',[0.3 0.3]); 
  hold off;
end
print('output/1_2_humans', '-dpng');
close;

% Visualizing top number_of_detections detections
figure(3); clf; imshow(testing_image);
for i = 1:number_of_detections
  % draw a rectangle.  use color to encode confidence of detection
  %  top scoring are green, fading to red
  hold on; 
  h = rectangle('Position',[x_multi(i)-64 y_multi(i)-64 128 128],'EdgeColor',[(i/number_of_detections) ((number_of_detections-i)/number_of_detections)  0],'LineWidth',3,'Curvature',[0.3 0.3]); 
  hold off;
end
print('output/2_2_humans', '-dpng');
close;
