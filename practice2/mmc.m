function Ry_123 = mmc(CC, ny, n1, n2, n3)
% calculate multiple correlation coefficient
% ------ INPUT ------
% CC(4*4 double): correlation coefficient matrix
% ny(int): the index for y
% n1(int): the index for x1
% n2(int): the index for x2
% n3(int): the index for x3
% ------ OUTPUT ------
% Ry_123: the multiple correlation coefficient between y and x1, x2, x3

% calculate First-order partial correlation coefficient

    fun = @(data, x, y, z) ...
        (data(x, y)-data(x, z)*data(y, z)) ...
        / sqrt( (1 - data(x, z) ^ 2) * (1 - data(y, z) ^ 2) );
    
    % calculate Second-order partial correlation coefficient
    ffun = @(data, a, b, c, d) ...
        ( (fun(data, a, b, c) - ( fun(data, a, d, c) * ( fun(data, b, d, c) ) )) ...
        / sqrt( (1 - fun(data, a, d, c) ^ 2) * (1 - fun(data, b, d, c) ^ 2) ) );
    
    Ry1 = CC(ny, n1);
    Ry2_1 = fun(CC, ny, n2, n1);
    Ry3_12 = ffun(CC, ny, n3, n1, n2);
    Ry_123 = sqrt(1 - (1 - Ry1 ^ 2) * (1 - Ry2_1 ^ 2) * (1 - Ry3_12 ^ 2));
end