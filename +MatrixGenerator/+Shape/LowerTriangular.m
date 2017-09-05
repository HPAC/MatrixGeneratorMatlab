classdef LowerTriangular < MatrixGenerator.Shape.ShapeType
    
    properties
    end
    
    methods
        function obj = LowerTriangular()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shape.Band(size(1) - 1, 0, false);
        end
    end
    
end

