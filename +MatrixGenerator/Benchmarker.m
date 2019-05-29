classdef Benchmarker < handle

    properties
        Timings = cell(0, 0);
        cs = rand(1, 7500000);
    end

    methods

        function res = benchmark(obj, labels, iters, f)
            timings = zeros(iters, 1);

            obj.cs = obj.cs + 1e-4;
            [res, time] = f();
            timings(1) = time;

            for i=2:iters
                obj.cs = obj.cs + 1e-4;
                [res, time] = f();
                timings(i) = time;
            end

            obj.Timings(size(obj.Timings, 1) + 1, :) = [labels {timings(:)}];
        end

        function save(obj, filename)
            timings_filename = strcat(filename, '_timings.txt');
            writetable(cell2table(obj.Timings), timings_filename, 'Delimiter', '\t');
        end

    end

end

