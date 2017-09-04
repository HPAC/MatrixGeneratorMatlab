classdef Symmetric
    
    properties
    end
    
    methods
        function obj = Symmetric()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shapes.Band(size(1) - 1, size(2) - 1, true);
        end
    end
    
end

