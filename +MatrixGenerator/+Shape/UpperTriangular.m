classdef UpperTriangular < MatrixGenerator.Shape.ShapeType
    
    properties
    end
    
    methods
        function obj = UpperTriangular()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shape.Band(0, size(2) - 1, false);
        end
    end
    
end

