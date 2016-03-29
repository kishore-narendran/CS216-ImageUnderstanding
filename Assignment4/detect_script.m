% Loading a training image
training_image = im2double(rgb2gray(imread('images/test2.jpg')));

% Get user clicks, on training examples
% Average training example is calculated for multiple clicks
number_of_clicks = 1;
figure(1); clf;
imshow(training_image);
[x,y] = ginput(number_of_clicks); %get nclicks from the user

% Finding 8x8 block where the user clicks
blockx = round(x/8);
blocky = round(y/8); 

% Visualizing the blocks, that the user clicked on
figure(2); clf;
for i = 1:number_of_clicks
  patch = training_image(8*blocky(i)+(-63:64),8*blockx(i)+(-63:64));
  figure(2); subplot(3,2,i); imshow(patch);
end

% COmputing gradient of histogram features for the training image
itrain_hog = hog(training_image);

% Computing the average template for the user clicks
template = zeros(16,16,9);
for i = 1:number_of_clicks
  template = template + itrain_hog(blocky(i)+(-7:8),blockx(i)+(-7:8),:); 
end
template = template/number_of_clicks;

% Loading the test image
testing_image= im2double(rgb2gray(imread('images/test4.jpg')));


% Finding n detections in the test image
number_of_detections = 5;
[ x, y, score ] = detect(testing_image, template, number_of_detections);

% Visualizing top number_of_detections detections
figure(3); clf; imshow(testing_image);
for i = 1:number_of_detections
  % draw a rectangle.  use color to encode confidence of detection
  %  top scoring are green, fading to red
  hold on; 
  h = rectangle('Position',[x(i)-64 y(i)-64 128 128],'EdgeColor',[(i/number_of_detections) ((number_of_detections-i)/number_of_detections)  0],'LineWidth',3,'Curvature',[0.3 0.3]); 
  hold off;
end
print('output/1_1_test4', '-dpng');
close;

