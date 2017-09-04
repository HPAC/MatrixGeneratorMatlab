
classdef General
    
    properties
    end
    
    methods
        function obj = General()
        end
        
        function [band, symmetric] = to_band(obj, size)
            import MatrixGenerator.Shapes.*;
            band = Band(size(1) - 1, size(2) - 1);
            symmetric = false;
        end
    end
    
end

