function accu = calculateAccuracy(predicted,groundTruth)
    if size(groundTruth) ~= size(predicted)
        error('Images must be of the same size');
    end
    
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
