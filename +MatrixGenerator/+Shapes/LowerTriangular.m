classdef LowerTriangular < MatrixGenerator.Shapes.ShapeType
    
    properties
    end
    
    methods
        function obj = LowerTriangular()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shapes.Band(size(1) - 1, 0, false);
        end
    end
    
end

