# Matlab-functions-for-Prinicipal-Component-Analysis
The repository includes elementary Matlab functions for replicating principal component analysis (PCA) techniques that can be used to different applications.

Principal Component Analysis (PCA) is a technique for decomposing the input matrix X into two separate matrices, L and S. The matrix L represents the low-rank components, while the matrix S represents the sparse components. Some of the variables and functions used are described below:
Data_Matrix: m1 x m2 sized matrix for decomposition
Aug_lgn:  Augmented lagrangian parameter
error_tolerance: R econstruction error tolerance
max_iter:  Total Iterations
[U,S,V] = svd(X,'econ') produces the "economy size" decomposition. If X is m-by-n with m >= n, then it is equivalent to svd(X,0). For m < n, only the first m columns of V are computed and S is m-by-m.
rank(A,TOL) is the number of singular values of A that are larger than TOL. By default, TOL = max(size(A)) * eps(norm(A))


