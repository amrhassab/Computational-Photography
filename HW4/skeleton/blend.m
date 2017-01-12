function [ im_blended ] = blend( im_input1, im_input2 )
%BLEND Blends two images together via feathering
% Pre-conditions:
%     `im_input1` and `im_input2` are both RGB images of the same size
%     and data type
% Post-conditions:
%     `im_blended` has the same size and data type as the input images
    
    assert(all(size(im_input1) == size(im_input2)));
    assert(size(im_input1, 3) == 3);
    
    im_blended = zeros(size(im_input1), 'like', im_input1);

    %------------- YOUR CODE STARTS HERE -----------------
%{
    im_input1 = im2double(im_input1);
    im_input2 = im2double(im_input2);
    
    R1 = im_input1(:,:,1);
    G1 = im_input1(:,:,2);
    B1 = im_input1(:,:,3);
    R2 = im_input2(:,:,1);
    G2 = im_input2(:,:,2);
    B2 = im_input2(:,:,3);
    
    alpha1 = rgb2alpha(im_input1);
    alpha2 = rgb2alpha(im_input2);
    
    IR = (alpha1 .* R1 + alpha2 .* R2) ./ (alpha1 + alpha2);
    IG = (alpha1 .* G1 + alpha2 .* G2) ./ (alpha1 + alpha2);
    IB = (alpha1 .* B1 + alpha2 .* B2) ./ (alpha1 + alpha2);
    
    im_blended(:,:,1) = IR;
    im_blended(:,:,2) = IG;
    im_blended(:,:,3) = IB;
    %}
    
    
    alpha1 = rgb2alpha(im_input1);
    alpha2 = rgb2alpha(im_input2);

    %multiply each channel by the alpha value
    im_input1(:,:,1) = im_input1(:,:,1).* alpha1(:,:);
    im_input1(:,:,2) = im_input1(:,:,2).* alpha1(:,:);
    im_input1(:,:,3) = im_input1(:,:,3).* alpha1(:,:);
    
    im_input2(:,:,1) = im_input2(:,:,1).* alpha2(:,:);
    im_input2(:,:,2) = im_input2(:,:,2).* alpha2(:,:);
    im_input2(:,:,3) = im_input2(:,:,3).* alpha2(:,:);
    
    im_blended(:,:,1) = im_input1(:,:,1) + im_input2(:,:,1);
    im_blended(:,:,2) = im_input1(:,:,2) + im_input2(:,:,2);
    im_blended(:,:,3) = im_input1(:,:,3) + im_input2(:,:,3);
    
    %accumulate alpha values
    im_blended_alpha = alpha1 + alpha2;
    
    [heights,widths] = size(im_blended_alpha);

    for i = 1:heights
        for j = 1 : widths
            if im_blended_alpha(i,j) > 0
                im_blended(i,j,1) = im_blended(i,j,1)./im_blended_alpha(i,j);
                im_blended(i,j,2) = im_blended(i,j,2)./im_blended_alpha(i,j);
                im_blended(i,j,3) = im_blended(i,j,3)./im_blended_alpha(i,j);
            end
        end
    end
    
    %------------- YOUR CODE ENDS HERE -----------------

end

function im_alpha = rgb2alpha(im_input, epsilon)
% Returns the alpha channel of an RGB image.
% Pre-conditions:
%     im_input is an RGB image.
% Post-conditions:
%     im_alpha has the same size as im_input. Its intensity is between
%     epsilon and 1, inclusive.

%% computing alpha channels:

    %------------- YOUR CODE STARTS HERE -----------------
    if nargin < 2
        epsilon = 0.001;
    end
    
    im_input = im2double(im_input);
   
    im_bin = rgb2gray(im_input) == 0;
    dist = im2double(bwdist(im_bin,'euclidean'));
    im_alpha = dist/max(dist(:));
 
    
    
    %------------- YOUR CODE ENDS HERE -----------------

end
