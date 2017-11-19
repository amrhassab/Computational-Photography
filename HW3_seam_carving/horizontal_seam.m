function S = horizontal_seam( I )


E = imenergy(I);
M = zeros(size(E));

% STEP 1: computing minimum energy array from left to right
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

% STEP 2: calculate row number to be removed from every column
    % left to right sweep
    Stemp = zeros(1, sizeE(2));
    
    [~, j] = min(M(:,sizeE(2)));
    
    for i = 1:sizeE(2)
        itrans = sizeE(2) + 1 - i;
        Stemp(1,itrans) = j;
        
        if j == 1 && itrans ~= 1
            temp = [ inf M(j,itrans-1) M(j+1 ,itrans-1) ];
            [~, x] = min(temp);
            
            switch x
                case 2
                    % j stays the same
                case 3
                    j = j + 1;
            end
        
        elseif j == sizeE(1) && itrans ~= 1
            
            temp = [ M(j-1 ,itrans-1) M(j, itrans-1) inf];
            [~, x] = min(temp);
            
            switch x
                case 1
                    j = j - 1;
                case 2
                    % j stays the same
            end
        elseif itrans ~= 1
            
            temp = [ M(j-1 ,itrans-1) M(j, itrans-1) M(j + 1,itrans-1)];
            [~, x] = min(temp);
            
            switch x
                case 1
                    j = j - 1;
                case 2
                    % j stays the same
                case 3
                    j = j + 1;
            end
        end
        
    end

    S = Stemp;
end

