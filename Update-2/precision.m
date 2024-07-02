function preci = precision(img,imgGT)
    trueLabels = imgGT;
    predictedLabels = img;    
    % Calculate precision
    truePositives = sum(trueLabels == 1 & predictedLabels == 1);
    falsePositives = sum(trueLabels == 0 & predictedLabels == 1);
    preci = truePositives / (truePositives + falsePositives);
    preci = accuracy*100;

end
