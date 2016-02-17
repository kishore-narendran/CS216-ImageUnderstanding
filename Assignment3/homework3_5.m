img = im2double(imread('segtest2.jpg'));
imshow(img);
[ x, y ] = ginput(2);
close;

H = size(img,1);
W = size(img,2);
N = size(img,1)*size(img,2);

lambda = 15;
segclass = zeros(N,1);
pairwise = sparse(N,N);

% Finding the average color in the background and foreground around the
% points clicked
background_color = get_average_color(img, y(1,1), x(1,1));
foreground_color = get_average_color(img, y(2,1), x(2,1));
img_flattened = reshape(img, [N 3]);

background_color_diff = pdist2(img_flattened, background_color)./sqrt(3);
foreground_color_diff = pdist2(img_flattened, foreground_color)./sqrt(3);

% Define binary classification problem
labelcost = [0 1;1 0]*lambda;
unary = [background_color_diff foreground_color_diff]';

%add all horizontal links
for i = 1:W-1
  for j = 1:H
    node  = 1 + (j-1) + (i-1)*H;
    right = 1 + (j-1) + i*H;
    distance = pdist2(img_flattened(node,:), img_flattened(right,:))./sqrt(3);
    pairwise(node,right) = distance;
    pairwise(right,node) = distance;
  end
end

%add all vertical nbr links
for i = 1:W
  for j = 1:H-1
    node = 1 + (j-1) + (i-1)*H;
    down = 1 + j + (i-1)*H;
    distance = pdist2(img_flattened(node,:), img_flattened(down,:))./sqrt(3);
    pairwise(node,down) = distance;
    pairwise(down,node) = distance;
  end
end

[labels E Eafter] = GCMex(segclass, single(unary), pairwise, single(labelcost),0);

subplot(211);
imshow(img);
hold on;
plot(x,y,'x', 'MarkerEdgeColor', 'r');
title('Original image');
subplot(212);
imagesc(reshape(labels,[H W]));
title('Min-cut');
print('code/output/output3_5_a_segtest2', '-dpng');

