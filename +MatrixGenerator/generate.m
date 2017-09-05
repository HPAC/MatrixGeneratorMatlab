
function [matrix] = generate(size, varargin)
    
    [band, algorithm, properties] = process_args(size, varargin{:});
    disp(band)  
    disp(algorithm)
    matrix = algorithm.generate(size, band, properties);
end

function [band, algorithm, properties] = process_args(size, varargin)

    properties = [];
    band = MatrixGenerator.Shapes.Band(intmax, intmax);
    for i = 1:length(varargin)
        if isa(varargin{i}, 'MatrixGenerator.Shapes.ShapeType')
            band.merge_with(varargin{i}.to_band(size));
        elseif isa(varargin{i}, 'MatrixGenerator.Properties.PropertyType')
            % Ignore properties others than the first match
            if ~exist('algorithm', 'var') && is_major_property(varargin{i})
                algorithm = varargin{i};
            else
                properties = [properties varargin{i}];
            end 
        else
            error('Unknown property type');
        end
    end
    band = band.cast();
    if ~exist('algorithm', 'var')
        error('No algorithm has been provided');
    end
end

function [val] = is_major_property(property)
    if isa(property, 'MatrixGenerator.Properties.Random')
        val = true;
    else
        val = false;
    end
end