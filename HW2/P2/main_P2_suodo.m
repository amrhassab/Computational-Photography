clear, clc
%% Problem #2 Demosaicing
R = zeros(480, 600);
G = zeros(480, 600);
B = zeros(480, 600);

img1 = imread('P2-crayons-raw.bmp');
img1 = im2double(img1);

%% seperating the RGB components from origonal
R(1:2:480, 1:2:600) = img1(1:2:480, 1:2:600);
G(1:2:480, 2:2:600) = img1(1:2:480, 2:2:600);
G(2:2:480, 1:2:600) = img1(2:2:480, 1:2:600);
B(2:2:480, 2:2:600) = img1(2:2:480, 2:2:600);

%% 5x5 filters
% red filters
FR1 = [1 0 1
       0 0 0
       1 0 1]/4;
FR2 = [0 1 0
       0 0 0
       0 1 0]/2;
FR3 = [0 0 0
       1 0 1
       0 0 0]/2;

% green filters
FG1 = [0 1 0
       0 0 0
       0 1 0]/4;
FG2 = [0 0 0
       1 0 1
       0 0 0]/4;

% blue filters
FB1 = [1 0 1
       0 0 0
       1 0 1]/4;
FB2 = [0 1 0
       0 0 0
       0 1 0]/2;
FB3 = [0 0 0
       1 0 1
       0 0 0]/2;
   
   
%% filtering & combining
% red
RF1 = imfilter(R, FR1);
RF2 = imfilter(R, FR2);
RF3 = imfilter(R, FR3);

RFF = R + RF1 + RF2 + RF3;

% green
GF1 = imfilter(G, FG1);
GF2 = imfilter(G, FG2);

GFF = G + GF1 + GF2;

% blue
BF1 = imfilter(B, FB1);
BF2 = imfilter(B, FB2);
BF3 = imfilter(B, FB3);


BFF  = B + BF1 + BF2 + BF3; 

img1_out(:,:,1) = RFF;
img1_out(:,:,2) = GFF;
img1_out(:,:,3) = BFF;

figure; imshow(img1)
figure; imshow(im2uint8(img1_out))