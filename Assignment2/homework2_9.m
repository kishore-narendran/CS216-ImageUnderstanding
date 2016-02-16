% Loading the image and template

img = im2double(imread('dilbert.jpg'));
template = im2double(imread('dilbert-template1.jpg'));

% Performing normalized correlation and non maximal supression
c = conv2(img,rot90(template,2), 'same');
template_square = sum(sum(template.^2));
image_square = conv2(img.^2,ones(size(template)), 'same');
ssd = image_square - 2*c + template_square;
% Displaying the Normalized Correlation values
imagesc(ssd);
colorbar;
colormap jet;

ssd = ssd./max(max(ssd));
ssd = non_minimal_supression(ssd);

% Thresholding the correlation values
threshold = 0.17; % 0.265;
% [ ypeaks, xpeaks ] = find(nc == min(min(nc)));
[ ypeaks, xpeaks ] = find(ssd<threshold);

% Drawing squares around the pixels with high enough threshold
hFig = figure;  
hAx  = axes;
imshow(img,'Parent', hAx);
hold on;
plot(xpeaks,ypeaks, 'o', 'MarkerSize', max(size(template)), 'Color', 'blue');
