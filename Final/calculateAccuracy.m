% This accuracy score is calculated by flattening the arrays and
% comparing the values in the arrays of both images. The accuracies may not
% be accurate and this is not the standard method for calculating the
% accuracies. SSIM is one of the standard method for finding the accuracy.
% This calculates the black areas as well since it flattens the array not
% only the predicted lines but also the empty area(black area) is also calculated
function accu = calculateAccuracy(predicted,groundTruth)
    % predicted = im2gray(predicted);
    % groundTruth = im2gray(groundTruth);
    if size(groundTruth) ~= size(predicted)
        error('Images must be of the same size');
    end
    
    predicted = im2bw(predicted);
    groundTruth = im2bw(groundTruth);

    % Flatten the images
    groundTruth_flat = groundTruth(:);
    predicted_flat = predicted(:);
    
    % Calculate the number of pixels that match
    numMatchingPixels = sum(groundTruth_flat == predicted_flat);
    
    % Calculate the accuracy
    totalPixels = numel(groundTruth_flat);
    accuracy = numMatchingPixels / totalPixels;
    
    % Display the accuracy
    accu = accuracy*100;
end
