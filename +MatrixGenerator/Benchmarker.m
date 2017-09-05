classdef Benchmarker < handle
    
    properties
        Results = cell(0, 5);
    end
    
    methods
        
        function benchmark(obj, label, iters, f)
            timings = zeros(iters, 1);  
            
            % Warmup call
            tic();
            f();
            t = toc();

            for i=1:iters
                tic();
                f();
                timings(i) = toc();
            end

            % Process results
            avg_ = mean(timings);
            stddev_ = std(timings);
            min_ = min(timings);
            max_ = max(timings);
            obj.Results(size(obj.Results, 1) + 1, :) = {label avg_ stddev_ min_ max_};
        end
        
        function save(obj, filename)
            % The easiest way to write to file a cell array
            % is to convert it to a table
            % https://www.mathworks.com/examples/matlab/mw/matlab-ex07445498-export-cell-array-to-text-file
            writetable(cell2table(obj.Results, 'VariableNames', {'algorithm', 'Time', 'StdDev', 'Min', 'Max'}),...
                filename, 'Delimiter', '\t');
        end
        
    end
    
end

