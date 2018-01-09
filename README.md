# MatlabMatrixGenerator

Matlab package supporting benchmarking of functions with automatic export of measurement data to a CSV file and generation of matrices with desired shapes and properties.

Supported matrix shapes: full, symmetric, upper/lower triangular (non-square as well), diagonal

When multiple shape properties are provided, the generator tries to find the largest matrix shape satisfying all requirements. For all example, merging General matrix type with LowerTriangular creates a lower triangular matrix.

Support matrix properties: random, symmetric positive-definite

Short example of using the library

```matlab
import MatrixGenerator.*;
% creates 3x3 random matrix 
generate([3, 3], Properties.Random(), Shape.General());
% creates 3x3 random symmetric matrix with entries in range [-5, 5)
generate([3, 3], Shape.Symmetric(), Properties.Random([-5, 5]))
% 4x4 diagonal and symmetric positive-definite matrix
generate([4,4], Shape.UpperTriangular(), Shape.General(), Shape.Diagonal(), Properties.SPD());
```
