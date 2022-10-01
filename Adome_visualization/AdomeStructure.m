function [x, y, z] = AdomeStructure()
    %% Generate geodesic ADome structure
    [A, xy] = bucky;         % Generate bucky matrix 
    [i, j] = find(triu(A));  
    B = permute(cat(3, xy(i, :),xy(j, :)), [3 1 2]);
    
    % Plot upper-part bucky 
    length = 1:40;
    x = B(:, length, 1);
    y = B(:, length, 2);
    z = B(:, length, 3);
end