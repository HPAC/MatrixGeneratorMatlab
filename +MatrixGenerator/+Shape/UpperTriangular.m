classdef UpperTriangular < MatrixGenerator.Shapes.ShapeType
    
    properties
    end
    
    methods
        function obj = UpperTriangular()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shapes.Band(0, size(2) - 1, false);
        end
    end
    
end

