classdef Band
    
    properties
        LowerBandwidth
        UpperBandwidth
    end
    
    methods
        function obj = Band(lower, upper)
            obj.LowerBandwidth = lower;
            obj.UpperBandwidth = upper;
        end
        
        function band = to_band(obj, size)
            band = obj;
        end
    end
    
end

