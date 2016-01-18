% Reading the image. 
% Converting to Grayscale. 
% Storing the double values in a variable

A = rgb2gray(imread('img.jpg'));
A = im2double(A);

% Part 5(a) 
% Sorting, storing, and plotting pixel intensities of A

x = A(:);
x = sort(x);
plot(x);
xlabel('Index');
ylabel('Pixel Intensity Value');
print('results/part5a', '-dpng');
pause;

% Part 5(b)
% Histogram of A's intensities

histogram(A, 32);
xlabel('Binned Pixel Intensity Values');
ylabel('# of Pixels');
print('results/part5b', '-dpng');
pause;

% Part 5(c)
% Conversion to binary image by threshold t

threshold = 0.5;
B = A;
B ( B >= threshold ) = 1;
B ( B < threshold ) = 0;
imwrite(B, 'results/part5c.png');
imshow(B);
pause;

% Part 5(d)
% Bottom right quadrant of A

btmRightQuad = A(50:100, 50:100);
imwrite(btmRightQuad, 'results/part5d.png');
imshow(btmRightQuad);
pause;

% Part 5(e)
% Subtract mean pixel intensity image

avgPxlVal = mean2(A);
subtractedImage = A;
subtractedImage = subtractedImage - avgPxlVal;
subtractedImage ( subtractedImage <= 0 ) = 0;
imwrite(subtractedImage, 'results/part5e.png');
imshow(subtractedImage);
pause;

% Part 5(f)
% Mirror flipped image

mirrorFlippedImage = A(:,end:-1:1);
imwrite(mirrorFlippedImage, 'results/part5f.png');
imshow(mirrorFlippedImage);
pause;

% Part 5(g) - Function as found in the code directory

% Part 5(h)
% Finds minimum pixel values
% Finds row, colum indices at which x is the pixel intensity

x = min(min(A));
r = find(min(A') == min(min(A'))); 
c = find(min(A) == min(min(A)));
disp('Rows in which pixel intensity is x');
disp(r);
disp('Columns in which pixel intensity is x');
disp(c);

% Part 5(i)

v = [1 8 8 2 1 3 9 8];
disp(v);
disp('Unique Values in v');
disp(size(unique(v), 2));














