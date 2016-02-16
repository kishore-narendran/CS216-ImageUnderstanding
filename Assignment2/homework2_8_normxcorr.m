img = im2double(imread('dilbert.jpg'));
template = im2double(imread('dilbert-template2.jpg'));
c = normxcorr2(template, img);
imagesc(c);
colormap jet;
colorbar
figure, surf(c), shading flat; 

c = non_maximal_supression(c);

threshold = 0.82;
[ ypeaks, xpeaks ] = find(c>threshold);

hFig = figure;  
hAx  = axes;
imshow(img,'Parent', hAx);
for i = 1:size(ypeaks, 1)
    ypeak = ypeaks(i,1);
    xpeak = xpeaks(i,1);
    yoffSet = ypeak-size(template,1);
    xoffSet = xpeak-size(template,2);
    imrect(hAx, [xoffSet, yoffSet, size(template,2), size(template,1)]);
end