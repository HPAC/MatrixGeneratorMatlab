classdef Diagonal < MatrixGenerator.Shape.ShapeType
    
    properties
    end
    
    methods
        function obj = Diagonal()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shape.Band(0, 0, true);
        end
    end
    
end

