% comandos de liempieza %
close all;
clear;
clc;

% carga del paquete parallel %
pkg load parallel

vector_x = [0:9];
vector_z = [10:19];

num = 999999999;

%vector_y_1 = pararrayfun(nproc, @myfun, vector_x, "Vectorized", true, "ChunksPerProc", 1)

%vector_y_2 = pararrayfun(nproc, @myfun2, vector_x, vector_z, "Vectorized", true, "ChunksPerProc", 1)

%vector_y_3 = pararrayfun(nproc, @myfun3, vector_x, num, "Vectorized", true, "ChunksPerProc", 1)
