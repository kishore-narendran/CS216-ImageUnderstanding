% Loading the image and template

img = im2double(imread('dilbert.jpg'));
template = im2double(imread('dilbert-template1.jpg'));

% Performing normalized correlation and non maximal supression
correlation = conv2(img, rot90(template,2), 'same');
cgg = conv2(img.^2, ones(size(template)), 'same');
nc = correlation./cgg.^0.5;


% Displaying the Normalized Correlation values
imagesc(nc);
colorbar;
colormap jet;

% Performing non maximal supression
nc = nc./max(max(nc));
nc = non_maximal_supression(nc);

% Thresholding the correlation values
threshold = 0.914;
[ ypeaks, xpeaks ] = find(nc>threshold);

% Drawing squares around the pixels with high enough threshold
hFig = figure;
hAx  = axes;
imshow(img,'Parent', hAx);
hold on;
template_x = size(template,2)/2;
template_y = size(template,1)/2;
for i = 1:size(ypeaks, 1)
    ypeak = ypeaks(i,1);
    xpeak = xpeaks(i,1);
    % imrect(hAx, [xpeak - template_x, ypeak - template_y, size(template,2), size(template,1)]);
    plot(xpeak, ypeak, 'o', 'MarkerSize', max(size(template)), 'Color', 'red');
end
