classdef Random < MatrixGenerator.Properties.PropertyType
    
    methods
        
        function [matrix] = generate(obj, size, type, varargin)
            
            boundaries = [-1 1];
            for i = 1:length(varargin)
                if isa(varargin{i}, 'MatrixGenerator.Properties.Positive')
                    boundaries = [0 1];
                elseif isa(varargin{i}, 'MatrixGenerator.Properties.Negative')
                    boundaries = [-1 0];
                end
            end
            
            if isa(type, 'MatrixGenerator.Shapes.General')
                matrix = random_general(boundaries, size);
            elseif isa(type, 'MatrixGenerator.Shapes.Symmetric')
                matrix = random_symmetric(boundaries, size);
            elseif isa(type, 'MatrixGenerator.Shapes.UpperTriangular')
                matrix = random_triangular(boundaries, size, 'U');
            elseif isa(type, 'MatrixGenerator.Shapes.LowerTriangular')
                matrix = random_triangular(boundaries, size, 'L');
            elseif isa(type, 'MatrixGenerator.Shapes.Diagonal')
                matrix = random_diagonal(boundaries, size);
            else
                error('Unknown matrix type');
            end
        end
        
    end
    
end

function [matrix] = random_general(boundaries, size)
    matrix = boundaries(1) + (boundaries(2) - boundaries(1))*rand(size);
end

function [matrix] = random_symmetric(boundaries, size)
    matrix = random_general(boundaries, size);
    matrix = matrix + matrix';
end

function [matrix] = random_triangular(boundaries, size, uplo)
    matrix = random_general(boundaries, size);
    if uplo == 'U'
        matrix = triu(matrix);
    else
        matrix = tril(matrix);
    end
end

function [matrix] = random_diagonal(boundaries, matrix_size)
    matrix = boundaries(1) + (boundaries(2) - boundaries(1))*rand(size);
    disp(matrix)
    matrix = diag(matrix);
end
