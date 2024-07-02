% Ground truth and Accuracy using the predicted image and the Ground Truth
% image
function accuracyValue = findIOUAccuracy(img, imgGT)
    imgGT = imgGT> 0;
    img = img> 0;
    
    % Calculate IoU
    intersection = sum(imgGT(:) & img(:));
    union = sum(imgGT(:) | img(:));
    accuracyValue = intersection / union;
    accuracyValue = accuracyValue*100;
end