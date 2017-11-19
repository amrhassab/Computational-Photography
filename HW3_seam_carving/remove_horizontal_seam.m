function J = remove_horizontal_seam(I, S)

E = imenergy(I);
  
%% Remove horizontal seam


sizeI = size(I);
Jout = zeros(sizeI(1) - 1, sizeI(2), sizeI(3));

% must do for each RGB

for k = 1:3
% delete bottom row at end

    for i = 1:sizeI(2)
        index = S(1,i);
    
     % at mark shift column up
        for j = index:(sizeI(1) - 1)
            I(j,i,k) = I(j+1,i,k);
        end
    
    end
    
    
    Jout(:,:,k) = I(1:(sizeI(1) -1), 1:sizeI(2),k);
   
end

J = Jout;
end
