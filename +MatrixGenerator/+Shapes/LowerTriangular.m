classdef UpperTriangular
    
    properties
    end
    
    methods
        function obj = UpperTriangular()
        end
        
        function [band, symmetric] = to_band(~, size)
            band = MatrixGenerator.Shapes.Band(size(1) - 1, 0, false);
        end
    end
    
end

