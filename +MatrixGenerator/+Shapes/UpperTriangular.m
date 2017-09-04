classdef UpperTriangular
    
    properties
    end
    
    methods
        function obj = UpperTriangular()
        end
        
        function [band, symmetric] = to_band(obj, size)
            band = MatrixGenerator.Shapes.Band(0, size(2) - 1);
            symmetric = false;
        end
    end
    
end

