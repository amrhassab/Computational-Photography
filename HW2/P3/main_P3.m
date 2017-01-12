clear, clc
%% Problem #3 Color Transfer

% given photo (P3)
IP3 = imread('P3-source.jpg');
JP3 = imread('P3-target.jpg');

figure; imshow(IP3); 
figure; imshow(JP3);

KP3 = mycolortransfer(IP3, JP3);
imwrite(KP3, 'P3-out.jpg', 'jpg');
figure; imshow(KP3);

% my photos (taken from sample images)
myI = imread('P3-mysource.jpg');
myJ = imread('P3-mytarget.jpg');

%figure; imshow(myI); 
%figure; imshow(myJ);

myK = mycolortransfer(myI, myJ);
%imwrite(myK, 'P3-myout.jpg', 'jpg');

%figure; imshow(myK);