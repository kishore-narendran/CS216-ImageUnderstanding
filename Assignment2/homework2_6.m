% Calls function for forming 
% 1. Impulse Signal
% 2. Box Function of Width 5
% 3. Box Function of Width 10
% And generates plots for the signal, and magnitude plot of the signal in
% the frequency domain

signal_spatial_frequency(1,100);
pause;
signal_spatial_frequency(5,100);
pause;
signal_spatial_frequency(10,100);
pause;

% Calls function for forming 
% 1. Gaussian Signal of sigma=1
% 2. Gaussian Signal of sigma=2
% And generates plots for the signal, and magnitude plot of the signal in
% the frequency domain

gaussian_spatial_frequency(1);
pause;
gaussian_spatial_frequency(2);
pause;

image_combination_plot('img1.jpg', 'img2.jpg');
pause;
image_combination_plot('img3.jpg', 'img4.jpg');