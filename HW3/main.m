clear, clc
%% Homework #3: Image Resizing using Seam Carving

I = imread('union-terrace.jpg');
I = im2double(I);

%% Compute the energy function
E = imenergy(I);
sizeE = size(E);

%% Compute the optimal horizontal seam
S = horizontal_seam(I);
  
%% Remove horizontal seam
%J = remove_horizontal_seam(I,S);

%% Experiments

% #1
%{
imgA = shrnk(I,0,100);
imgB = shrnk(I,100,0);
imgC = shrnk(I,100,100);
    
imwrite(imgA, 'lastname.1a.jpg', 'jpg');
imwrite(imgB, 'lastname.1b.jpg', 'jpg');
imwrite(imgC, 'lastname.1c.jpg', 'jpg');
%}

% #2
%{
% computing minimum energy array from left to right

M = zeros(size(E));
M(:,1) = E(:,1);
sizeE = size(E);

for i = 2:sizeE(2)
    for j = 1:sizeE(1)
        backThree = [inf inf inf];
        if j == 1
            % do nothing
        else 
            backThree(1) = M(j-1, i-1);
        end
        
        backThree(2) = M(j, i-1);
        
        if j == sizeE(1) || i == sizeE(2)
            % do nothing
        else
            backThree(3) = M(j+1, i-1);
        end
       M(j,i) = E(j,i) + min(backThree);
    end
end

saveas(imagesc(E), 'lastname.2a.jpg', 'jpg');
saveas(imagesc(M), 'lastname.2b.jpg', 'jpg');
%}

% #3
%{
SH = horizontal_seam(I);
SV = horizontal_seam(permute(I, [2 1 3]));
sizeSV = size(SV);

figure; imshow(I)
hold on
plot(1:sizeE(2), SH)
plot(SV, 1:size(I, 1));
hold off

% saved using gui
%}

% #4
%{
myImg = im2double(imread('lastname.4a.jpg'));
myJ = shrnk(myImg, 0, 300);

figure;imshow(myImg)
figure;imshow(myJ)

imwrite(myJ, 'lastname.4b.jpg', 'jpg')
%}

% #4
%{
myImg2 = im2double(imread('lastname.5a.jpg'));
myJ2 = shrnk(myImg2, 400, 400);

figure;imshow(myImg2)
figure;imshow(myJ2)

imwrite(myJ2, 'lastname.5b.jpg', 'jpg')
%}1