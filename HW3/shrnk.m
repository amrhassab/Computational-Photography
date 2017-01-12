function J = shrnk(I, num_rows_removed, num_cols_removed)

    %% Remove horizontal seams
    Jtemp = I;
    for j = 1:num_rows_removed
        S = horizontal_seam(Jtemp);
        Jtemp = remove_horizontal_seam(Jtemp,S);
    end

    %% Remove vertical seams
    Jtemp = permute(Jtemp, [2 1 3]);
    for j = 1:num_cols_removed
        S = horizontal_seam(Jtemp);
        Jtemp = remove_horizontal_seam(Jtemp,S);
    end
    
    J = permute(Jtemp, [2 1 3]);
end

