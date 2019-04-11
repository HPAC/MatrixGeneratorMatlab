%FIXME: Add positive SPD
classdef SPD < MatrixGenerator.Properties.PropertyType
    
    methods
        
        function [matrix] = generate(~, size, type, varargin)
            
            if size(1) ~= size(2)
                error('SPD matrix has to be square');
            end
            if isa(type, 'MatrixGenerator.Shape.General')
                matrix = spd_general(size);
            elseif isa(type, 'MatrixGenerator.Shape.Symmetric')
                matrix = spd_symmetric(size);
            elseif isa(type, 'MatrixGenerator.Shape.UpperTriangular')
                matrix = spd_triangular(size, 'U');
            elseif isa(type, 'MatrixGenerator.Shape.LowerTriangular')
                matrix = spd_triangular(size, 'L');
            elseif isa(type, 'MatrixGenerator.Shape.Diagonal')
                matrix = spd_diagonal(size);
            else
                error('Unknown matrix type');
            end
        end
       
    end
    
end


function [matrix] = spd_general(size)
    disp('Generate SPD General')
    matrix = spd_symmetric(size);
end

function [matrix] = spd_symmetric(size)
    disp('Generate SPD Symmetric')
    n = size(1);
    tmp = randn(n, n);
    matrix = tril(tmp) + transpose(tril(tmp, -1)) + (2*sqrt(n)+3)*eye(n, n);
end

function [matrix] = spd_triangular(~, ~)
    error('SPD matrix cant be triangular');
end

function [matrix] = spd_diagonal(matrix_size)
    disp('Generate SPD Diagonal')
    matrix = diag( 9.5 + rand(matrix_size(1), 1) );
end
