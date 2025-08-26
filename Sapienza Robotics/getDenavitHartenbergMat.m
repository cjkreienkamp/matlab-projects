function [T, A] = getDenavitHartenbergMat(dhValues)
%   input: (n x 4) matrix of DH parameters composed like: [alpha a d theta;...]
%   output: product of all the transformation matrices

    T = eye(4);
    nums = size(dhValues);
    A = cell(1,nums(1));
    
    for i = 1:nums(1)
        alpha = dhValues(i,1);
        a = dhValues(i,2);
        d = dhValues(i,3);
        theta = dhValues(i,4);
        R = [cos(theta)            -sin(theta)           0           a             ;
             sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -d*sin(alpha) ;
             sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha)  d*cos(alpha)  ;
             0                     0                     0           1             ;];
        A{i} = R;
        T = T * R;   
    end

    if isa(T, 'sym')
        T = simplify(T);
    end
end