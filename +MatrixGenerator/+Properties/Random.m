classdef Random < MatrixGenerator.Properties.PropertyType
    
    properties
        Boundaries
    end
    
    methods
        
        function obj = Random(varargin)
            if isempty(varargin)
                obj.Boundaries = [-1 1];
            elseif length(varargin) == 1 && length(varargin{1}) == 2
                obj.Boundaries = varargin{1}; 
            else
                error('Incorrect settings for Random property');
            end
        end
        
        function [matrix] = generate(obj, size, type, varargin)
            
            boundaries = obj.Boundaries;
            for i = 1:length(varargin)
                if isa(varargin{i}, 'MatrixGenerator.Properties.Positive')
                    boundaries = [0 obj.Boundaries(2)];
                elseif isa(varargin{i}, 'MatrixGenerator.Properties.Negative')
                    boundaries = [obj.Boundaries(1) 0];
                end
            end
            
            if isa(type, 'MatrixGenerator.Shape.General')
                matrix = random_general(boundaries, size);
            elseif isa(type, 'MatrixGenerator.Shape.Symmetric')
                matrix = random_symmetric(boundaries, size);
            elseif isa(type, 'MatrixGenerator.Shape.UpperTriangular')
                matrix = random_triangular(boundaries, size, 'U');
            elseif isa(type, 'MatrixGenerator.Shape.LowerTriangular')
                matrix = random_triangular(boundaries, size, 'L');
            elseif isa(type, 'MatrixGenerator.Shape.Diagonal')
                matrix = random_diagonal(boundaries, size);
            else
                error('Unknown matrix type');
            end
        end
        
    end
    
end

function [matrix] = random_general(boundaries, size)
    disp('Generate Random General')
    matrix = boundaries(1) + (boundaries(2) - boundaries(1))*rand(size);
end

function [matrix] = random_symmetric(boundaries, size)
    disp('Generate Random Symmetric')
    matrix = random_general(boundaries, size);
    matrix = matrix + matrix';
end

function [matrix] = random_triangular(boundaries, size, uplo)
    disp('Generate Random Triangular')
    diag_size = min(size(1), size(2));
    tmp = sign(rand(diag_size, 1) - 0.5)*5 + (rand(diag_size, 1) - 0.5);
    if uplo == 'U'
        matrix = triu((rand(size(1), size(2)) - 0.5)*0.5, 1) + diag(tmp);
    else
        matrix = tril((rand(size(1), size(2)) - 0.5)*0.5, -1) + diag(tmp);
    end
end

function [matrix] = random_diagonal(boundaries, matrix_size)
    disp('Generate Random Diagonal')
    diag_size = min(matrix_size(1), matrix_size(2));
    matrix = diag(sign(rand(diag_size, 1) - 0.5)*10 + (rand(diag_size, 1) - 0.5));
    if matrix_size(1) > matrix_size(2)
        matrix = [matrix; zeros(matrix_size(1) - diag_size, matrix_size(2))];
    elseif matrix_size(1) < matrix_size(2)
        matrix = [matrix zeros(diag_size, matrix_size(2) - diag_size)];
    end
end
