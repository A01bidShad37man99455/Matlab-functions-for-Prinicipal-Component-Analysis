
% svd(X,'econ') produces the "economy size" decomposition. If X is m-by-n
% with m >= n, then it is equivalent to svd(X,0). For m < n, only the first
% m columns of V are computed and S is m-by-m. rank(A,TOL) is the number of
% singular values of A that are larger than TOL.

function x = Singular_shrinkage_operator(tau, Data_Matrix)
   [U, S, V] = svd(Data_Matrix, 'econ');
    x = shrinkage_operator*So(tau, S)*V';
end
