function J = mydemosaic( I )
%% outputs uint8 image
I = im2double(I);

imgSize = size(I);

R = zeros(imgSize(1), imgSize(2));
G = zeros(imgSize(1), imgSize(2));
B = zeros(imgSize(1), imgSize(2));

%% seperating the RGB components from origonal
R(1:2:imgSize(1), 1:2:imgSize(2)) = I(1:2:imgSize(1), 1:2:imgSize(2));
G(1:2:imgSize(1), 2:2:imgSize(2)) = I(1:2:imgSize(1), 2:2:imgSize(2));
G(2:2:imgSize(1), 1:2:imgSize(2)) = I(2:2:imgSize(1), 1:2:imgSize(2));
B(2:2:imgSize(1), 2:2:imgSize(2)) = I(2:2:imgSize(1), 2:2:imgSize(2));

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

img_out(:,:,1) = RFF;
img_out(:,:,2) = GFF;
img_out(:,:,3) = BFF;

J = im2uint8(img_out);
end

