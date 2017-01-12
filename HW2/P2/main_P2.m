clear, clc
%% Problem #2 Demosaicing

% Crayons image
Icrayons = imread('P2-crayons-raw.bmp');
Jcrayons = mydemosaic(Icrayons);

%figure; imshow(Icrayons)
%figure; imshow(Jcrayons)

%imwrite(Jcrayons, 'P2-crayons-demosaic.jpg', 'jpg');

% union image
Iunion = imread('P2-union-raw.bmp');
Junion = mydemosaic(Iunion);

%figure; imshow(Iunion)
%figure; imshow(Junion)

%imwrite(Junion, 'P2-union-demosaic.jpg', 'jpg');


%% Error
% done using double values

% Crayons error
camCrayons = imread('P2-crayons.jpg');
camCrayons = im2double(camCrayons);
Jcrayons = im2double(Jcrayons);

JR = Jcrayons(:,:,1);
JG = Jcrayons(:,:,2);
JB = Jcrayons(:,:,3);
CamR = camCrayons(:,:,1);
CamG = camCrayons(:,:,2);
CamB = camCrayons(:,:,3);

errorCrayons(:,:) = (CamR(:,:) - JR(:,:)).^2 + (CamG(:,:) - JG(:,:)).^2 +(CamB(:,:) - JB(:,:)).^2;
errorCrayons = im2uint8(errorCrayons);

%figure; imshow(errorCrayons)
%imwrite(errorCrayons, 'P2-crayons-error.jpg', 'jpg');


% union error
camUnion = imread('P2-union.jpg');
camUnion = imrotate(camUnion, 90);
camUnion = im2double(camUnion);
Junion = im2double(Junion);

JR = Junion(:,:,1);
JG = Junion(:,:,2);
JB = Junion(:,:,3);
CamR = camUnion(:,:,1);
CamG = camUnion(:,:,2);
CamB = camUnion(:,:,3);

errorUnion(:,:) = (CamR(:,:) - JR(:,:)).^2 + (CamG(:,:) - JG(:,:)).^2 +(CamB(:,:) - JB(:,:)).^2;
errorUnion = im2uint8(errorUnion);

%figure; imshow(errorUnion)
%imwrite(errorUnion, 'P2-union-error.jpg', 'jpg');






