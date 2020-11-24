close all;
clear;
clc;

pkg load parallel

%fun = @(x) x.^2

%vector_x = 1:10

%vector_y = pararrayfun(nproc, fun, vector_x, "Vectorized", true, "ChunksPerProc", 1)

A = [0.6060168 0.8340029 0.0064574 0.7133187;
0.6325375 0.0919912 0.5692567 0.7432627;
0.8292699 0.5136958 0.4171895 0.2530783;
0.7966113 0.1975865 0.6687064 0.3226548;
0.0163615 0.2123476 0.9868179 0.1478827];

N = 2;
[eigenvectors, eigenvalues] = pararrayfun(nproc, 
                                @(row_idx) eig(reshape(A(row_idx, :), N, N)), 
                                1:rows(A), "UniformOutput", false)