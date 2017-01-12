clear, clc;

%% Problem #1 Histogram Equalization
% bridge image
Ibridge = imread('P1-bridge.jpg');
Jbridge = myhisteq(Ibridge);

HSV_Ibridge = rgb2hsv(Ibridge);
HSV_Jbridge = rgb2hsv(Jbridge);
V_bridge = HSV_Ibridge(:, :, 3);
W_bridge = HSV_Jbridge(:, :, 3);

imwrite(Jbridge, 'P1-bridge-out.jpg');




% snow image
Isnow = imread('P1-snow.jpg');
Jsnow = myhisteq(Isnow);

HSV_Isnow = rgb2hsv(Isnow);
HSV_Jsnow = rgb2hsv(Jsnow);
V_snow = HSV_Ibridge(:, :, 3);
W_snow = HSV_Jbridge(:, :, 3);

imwrite(Jsnow, 'P1-snow-out.jpg');


