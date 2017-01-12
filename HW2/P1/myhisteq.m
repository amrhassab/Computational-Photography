function J = myhisteq(I)
%% outputs uint8 image 
I = im2double(I);

%% Step 1: convert to hsv
hsv = rgb2hsv(I);
V = hsv(:,:,3);
figure; imhist(V);
%% Step 2: Computing the Histogram and cumulative histogram of the V (luminence) image

h = imhist(V);
c = cumsum(h);

%% Step 3: transforming the intensity values in V to occupy the full range 0..255 in a new image W so that the histogram of W is roughly ?flat,?
size_V = size(V);
total_num_pixel = size_V(1) * size_V(2);
Vtemp = im2uint8(V) + 1;
W = max(0, ((256/total_num_pixel) * c( Vtemp(:,:))) - 1);
W = uint8(W);
figure; imhist(W);

%% Step 4: combining the original H and S channels with the W image to create a new color image, which is then converted to an RGB color output image
hsv_out = hsv;
hsv_out(:,:,3) = im2double(W);
J = hsv2rgb(hsv_out);
J = im2uint8(J);

end

