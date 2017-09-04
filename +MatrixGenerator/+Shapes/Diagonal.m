classdef Diagonal
    
    properties
    end
    
    methods
        function obj = Diagonal()
        end
        
        function [band, symmetric] = to_band(obj, size)
            band = MatrixGenerator.Shapes.Band(0, 0);
            symmetric = true;
        end
    end
    
end

