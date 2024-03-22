function x = shrinkage_operator(tau, Data_Matrix)
         x = sign(Data_Matrix) .* max(abs(Data_Matrix) - tau, 0);
end

