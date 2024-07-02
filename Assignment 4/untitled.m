% Read the image into the workspace
img1 = imread('C:\Users\harsh\OneDrive\Desktop\UNT Subjects\Feature Engineering\Assignment 4\pic1.png');

% Convert the image to grayscale (optional)
if size(img1, 3) == 3
    img1 = rgb2gray(img1);
end

% Apply Fourier Transform
fourier_img1 = fft2(double(img1));
% Shift the zero frequency components to the center
fourier_img1 = fftshift(fourier_img1);

% Display the original and Fourier transformed images
subplot(1, 2, 1);
imshow(uint8(img1));
title('Original Image');

subplot(1, 2, 2);
imshow(log(abs(fourier_img1) + 1), []); % Use log for better visualization
title('Fourier Transformed Image');

colormap(gca, 'gray'); % Set the colormap to grayscale

% Optional: Save the Fourier transformed image
imwrite(log(abs(fourier_img1) + 1), 'fourier_transformed.png'); % Save the result to a file
