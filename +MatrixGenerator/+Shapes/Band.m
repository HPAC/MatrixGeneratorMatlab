classdef Band < handle
    
    properties
        LowerBandwidth
        UpperBandwidth
        Symmetric
    end
    
    methods
        function obj = Band(lower, upper, varargin)
            obj.LowerBandwidth = lower;
            obj.UpperBandwidth = upper;
            obj.Symmetric = false;
            disp(nargin)
            if nargin > 3
               error('Only two or three parameters are allowed in the constructor')
            elseif nargin == 3
                symmetric = varargin{1};
                if ~isa(symmetric, 'logical')
                    error('Only logical values are allowed for this parameter')
                end
                obj.Symmetric = symmetric;
            else
                obj.Symmetric = false;
            end
        end
        
        function band = to_band(obj, size)
            band = obj;
        end
        
        function merge_with(obj, other_band)
            obj.LowerBandwidth = min(obj.LowerBandwidth, other_band.LowerBandwidth);
            obj.UpperBandwidth = min(obj.UpperBandwidth, other_band.UpperBandwidth);
            obj.Symmetric = obj.Symmetric | other_band.Symmetric;
        end
    end
    
end

