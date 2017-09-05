classdef General < MatrixGenerator.Shape.ShapeType
    
    properties
    end
    
    methods
        function obj = General()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shape.Band(size(1) - 1, size(2) - 1, false);
        end
    end
    
end

