function J = getJacobianOfVector(vector, variables)
%   initialize: declare every variable in variables a symbol with syms
%   input: vector and variables over which to differentiate
%       e.g.    syms q1 q2 q3 q4
%               variables = [q1 q2 q3 q4]
%   output: Jacobian

    n_rows = max( size(vector) );
    n_cols = max( size(variables) );
    J = sym( zeros( n_rows, n_cols ) );

    for col = 1:n_cols
        for row = 1:n_rows
            J(row,col) = diff(vector(row),variables(col));
        end
    end
end