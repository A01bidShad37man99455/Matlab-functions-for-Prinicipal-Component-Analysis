
% https://github.com/A01bidShad37man99455
% The repository includes elementary Matlab functions for replicating
% principal component analysis (PCA) techniques that can be used to
% different applications. Principal Component Analysis (PCA) is a technique
% for decomposing the input matrix X into two separate matrices, L and S.
% The matrix L represents the low-rank components, while the matrix S
% represents the sparse components.
% Data_Matrix: m1 x m2 sized matrix for
% decomposition Aug_lgn:  Augmented lagrangian parameter 
% error_tolerance: Reconstruction error tolerance max_iter:  Total Iterations [U,S,V] =
% svd(X,'econ') produces the "economy size" decomposition. If X is m-by-n
% with m >= n, then it is equivalent to svd(X,0). For m < n, only the first
% m columns of V are computed and S is m-by-m. rank(A,TOL) is the number of
% singular values of A that are larger than TOL.

function [L, S] = PCA(Data_Matrix, Regularization_parameter, Aug_lgn, error_tolerance, Max_iter)
    [m2, m1] = size(Data_Matrix);
    unobserved = isnan(Data_Matrix);
    Data_Matrix(unobserved) = 0;
    normX = norm(Data_Matrix, 'fro');  if nargin < 2
        Regularization_parameter = 1 / sqrt(max(m2,m1));
    end
    if nargin < 3
        Aug_lgn = 10*Regularization_parameter;
    end
    if nargin < 4
        error_tolerance = 1e-6;
    end
    if nargin < 5
        Max_iter = 1000;
    end
    L = zeros(m2, m1);
    S = zeros(m2, m1);
    Y = zeros(m2, m1);
    for i = (1:Max_iter)
        L = Do(1/Aug_lgn, Data_Matrix - S + (1/Aug_lgn)*Y);
        S = So(Regularization_parameter/Aug_lgn, Data_Matrix - L + (1/Aug_lgn)*Y);
         Z = Data_Matrix - L - S;
        Z(unobserved) = 0; 
        Y = Y + Aug_lgn*Z;
        error = norm(Z, 'fro') / normX;
        if (i == 1) || (mod(i, 10) == 0) || (error < error_tolerance)
            fprintf(1, 'i: %04d\terr: %f\trank(L): %d\tcard(S): %d\n', ...
                    i, error, rank(L), nnz(S(~unobserved)));
        end
        if (error < error_tolerance) break; end
    end
end

