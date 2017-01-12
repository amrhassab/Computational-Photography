clear, clc;

%% Problem #1 Histogram Equalization

% file input
img_bridge = imread('P1-bridge.jpg');
img_bridge = im2double(img_bridge);
%figure; imshow(img_bridge);

%% suedo function

% MYHISTEQ Histogram equalization
%% Step 1: convert to hsv
hsv_bridge = rgb2hsv(img_bridge);

H = hsv_bridge(:,:,1);
S = hsv_bridge(:,:,2);
V = hsv_bridge(:,:,3);

%% Step 2: Computing the Histogram and cumulative histogram of the V (luminence) image

h = imhist(im2uint8(V));
c = cumsum(h);
figure; imhist(V)
figure; bar(c);



%% Step 3: transforming the intensity values in V to occupy the full range 0..255 in a new image W so that the histogram of W is roughly ?flat,?
size_V = size(V);
total_num_pixel = size_V(1) * size_V(2);

Vtemp = im2uint8(V) + 1;

W = max(0, ((256/total_num_pixel) * c( Vtemp(:,:))) - 1);
W = uint8(W);
figure, imhist(W);


%% Step 4: combining the original H and S channels with the W image to create a new color image, which is then converted to an RGB color output image
hsv_bridge_out = hsv_bridge;
hsv_bridge_out(:,:,3) = im2double(W);
J = hsv2rgb(hsv_bridge_out);

figure; imshow(J)

