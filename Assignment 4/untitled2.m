% Task 1: Read the image into the workspace
img1 = imread('pic1.png');

% Task 2: Apply Fourier transform to img1
img1_fft = fft2(img1);

% Task 3: Display the frequency and phase matrices as images
magnitude = abs(img1_fft);
phase = angle(img1_fft);

subplot(2, 2, 1);
imshow(img1);
title('Original Image');

subplot(2, 2, 2);
imshow(log(1 + fftshift(magnitude)), []);
title('Frequency Magnitude');

subplot(2, 2, 3);
imshow(fftshift(phase), []);
title('Phase');

% Task 4: Remove low-frequency components and reconstruct the image
% Define a threshold to remove low-frequency components (adjust as needed)
threshold = 0.1;
high_pass_fft = img1_fft .* (abs(img1_fft) > threshold);
imgR = ifft2(high_pass_fft);

subplot(2, 2, 4);
imshow(uint8(abs(imgR)), []);
title('Reconstructed Image');

% Task 5: Construct and apply a spatial filter to img1
% You can design your spatial filter here or use a pre-defined one
% Here, we'll use a simple identity filter for demonstration
spatial_filter = [0 0 0; 0 1 0; 0 0 0];
filtered_img1 = conv2(double(img1), spatial_filter, 'same');

% Display the filtered image
figure;
subplot(1, 2, 1);
imshow(uint8(filtered_img1));
title('Filtered Image');

% Task 6: Compute and display the similarity score
ssim_score = ssim(uint8(filtered_img1), uint8(abs(imgR)));
disp(['SSIM Score: ', num2str(ssim_score)]);
