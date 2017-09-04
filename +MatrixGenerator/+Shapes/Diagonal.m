classdef Diagonal
    
    properties
    end
    
    methods
        function obj = Diagonal()
        end
        
        function [band] = to_band(~, size)
            band = MatrixGenerator.Shapes.Band(0, 0, true);
        end
    end
    
end

