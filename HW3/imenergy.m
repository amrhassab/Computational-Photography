function E = imenergy( I )
%% outputs double energy/gradient image
I = im2double(I);
E = imgradient(rgb2gray(I));

end

