classdef Benchmarker < handle

    properties
        Timings = cell(0, 0);
        Results = cell(0, 5);
    end

    methods

        function res = benchmark(obj, label, iters, f)
            timings = zeros(iters, 1);

            for i=1:iters
                rand(5000, 5000) + rand(5000, 5000); % Perform cache scrub
                [res, time] = f();
                timings(i) = time;
            end

            % Process results (exclude first warmup run)
            avg_ = mean(timings(2:end));
            stddev_ = std(timings(2:end));
            min_ = min(timings(2:end));
            max_ = max(timings(2:end));
            obj.Results(size(obj.Results, 1) + 1, :) = {label avg_ stddev_ min_ max_};
            obj.Timings(size(obj.Timings, 1) + 1, :) = {label timings(:)};
        end

        function save(obj, filename)
            writetable(cell2table(obj.Results, 'VariableNames', {'algorithm', 'Time', 'StdDev', 'Min', 'Max'}),...
                filename, 'Delimiter', '\t');
            temp = split(filename, '.');
            timings_filename = strcat(temp{1}, '_timings.', temp{2});
            writetable(cell2table(obj.Timings), timings_filename, 'Delimiter', '\t');
        end

    end

end

