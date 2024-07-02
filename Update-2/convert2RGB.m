function img_rgb = convert2RGB(img)
[rows, cols, channels] = size(img);
if channels == 1
    % Convert to RGB
    img_rgb = cat(3, img, img, img);
else
    img_rgb = img; % Image is already RGB
end
