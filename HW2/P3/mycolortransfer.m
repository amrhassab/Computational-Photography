function K = mycolortransfer( I, J )
% 
% I: source img (want to change), J: target img (one you want to steal
% color from)

source = rgb2lab(I); %outputs double image
target = rgb2lab(J);

SL = source(:,:,1);
SA = source(:,:,2);
SB = source(:,:,3);

TL = target(:,:,1);
TA = target(:,:,2);
TB = target(:,:,3);

%% Step 1: subtract the mean from the data points
SLstar = SL - mean2(SL);
SAstar = SA - mean2(SA);
SBstar = SB - mean2(SB);

%% scale the data points comprising the syn- thetic image

SLprime = ((std2(TL))/(std2(SL))) * SLstar;
SAprime = ((std2(TA))/(std2(SA))) * SAstar;
SBprime = ((std2(TB))/(std2(SB))) * SBstar;

SLprime = SLprime + mean2(TL);
SAprime = SAprime + mean2(TA);
SBprime = SBprime + mean2(TB);

out(:,:,1) = SLprime;
out(:,:,2) = SAprime;
out(:,:,3) = SBprime;

K = lab2rgb(out);
end

