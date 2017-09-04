classdef Symmetric
    
    properties
    end
    
    methods
        function obj = Symmetric()
        end
        
        function [band, symmetric] = to_band(obj, size)
            band = MatrixGenerator.Shapes.Band(size(1) - 1, size(2) - 1);
            symmetric = true;
        end
    end
    
end

