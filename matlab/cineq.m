clc
clear all
close all

n_phi = 4;

v1 = sym('p_end_x',  [1 n_phi]);
v2 = sym('p_end_y',  [1 n_phi]);
v3 = sym('p_init_x', [1 n_phi]);
v4 = sym('p_init_y', [1 n_phi]);
v5 = sym('dU_x',     [1 n_phi]);
v6 = sym('dU_y',     [1 n_phi]);
v7 = sym('db_x',     [1 n_phi]);
v8 = sym('db_y',     [1 n_phi]);
v9 = sym('dT',       [1 n_phi]);

v = []

for i = 1:n_phi
    v = vertcat(v, v1(i), v2(i), v3(i), v4(i), v5(i), v6(i), v7(i), v8(i), v9(i));
end

%% p_end
syms p_c_x_max
syms p_c_y_max
syms p_c_x_min
syms p_c_y_min
cineq1_max = []
cineq1_min = []

for i = 1:n_phi
    p_end_x  = v(9*(i-1) + 1);
    p_end_y  = v(9*(i-1) + 2);

    cineq1_max_x_sub = p_end_x - p_c_x_max;
    cineq1_max_y_sub = p_end_y - p_c_y_max;

    cineq1_min_x_sub =-p_end_x + p_c_x_min;
    cineq1_min_y_sub =-p_end_y + p_c_y_min;


    cineq1_max = vertcat(cineq1_max, cineq1_max_x_sub, cineq1_max_y_sub);
    cineq1_min = vertcat(cineq1_min, cineq1_min_x_sub, cineq1_min_y_sub);
end

cineq1_max_v = jacobian(cineq1_max, v)
cineq1_min_v = jacobian(cineq1_min, v)

%% p_init
syms p_c_x_max
syms p_c_y_max
syms p_c_x_min
syms p_c_y_min
cineq2_max = []
cineq2_min = []

for i = 1:n_phi
    p_init_x  = v(9*(i-1) + 3);
    p_init_y  = v(9*(i-1) + 4);

    cineq2_max_x_sub = p_init_x - p_c_x_max;
    cineq2_max_y_sub = p_init_y - p_c_y_max;

    cineq2_min_x_sub =-p_init_x + p_c_x_min;
    cineq2_min_y_sub =-p_init_y + p_c_y_min;

    cineq2_max = vertcat(cineq2_max, cineq2_max_x_sub, cineq2_max_y_sub);
    cineq2_min = vertcat(cineq2_min, cineq2_min_x_sub, cineq2_min_y_sub);
end

cineq2_max_v = jacobian(cineq2_max, v)
cineq2_min_v = jacobian(cineq2_min, v)

%% dU
syms dU_x_max
syms dU_y_max
syms dU_x_min
syms dU_y_min

cineq3_max = []
cineq3_min = []

for i = 1:n_phi
    dU_x  = v(9*(i-1) + 5);
    dU_y  = v(9*(i-1) + 6);

    cineq3_max_x_sub = dU_x - dU_x_max;
    cineq3_max_y_sub = dU_y - dU_y_max;

    cineq3_min_x_sub =-dU_x + dU_x_min;
    cineq3_min_y_sub =-dU_y + dU_y_min;

    cineq3_max = vertcat(cineq3_max, cineq3_max_x_sub, cineq3_max_y_sub);
    cineq3_min = vertcat(cineq3_min, cineq3_min_x_sub, cineq3_min_y_sub);
end

cineq3_max_v = jacobian(cineq3_max, v)
cineq3_min_v = jacobian(cineq3_min, v)

%% BIG M

cineq4_max = []
cineq4_min = []

M = sym('m', [1 n_phi])

for i = 1:n_phi
    dU_x  = v(9*(i-1) + 5);
    dU_y  = v(9*(i-1) + 6);

    m = M(i);

    cineq4_max_x_sub = dU_x - m;
    cineq4_max_y_sub = dU_y - m;

    cineq4_min_x_sub =-dU_x - m;
    cineq4_min_y_sub =-dU_y - m;

    cineq4_max = vertcat(cineq4_max, cineq4_max_x_sub, cineq4_max_y_sub);
    cineq4_min = vertcat(cineq4_min, cineq4_min_x_sub, cineq4_min_y_sub);
end

cineq4_max_v = jacobian(cineq4_max, v)
cineq4_min_v = jacobian(cineq4_min, v)

%% dT

cineq5_max = []
cineq5_min = []

syms dT_max dT_min

for i = 1:n_phi
    dT  = v(9*(i-1) + 9);
    
    cineq5_max_sub = dT - dT_max;

    cineq5_min_sub =-dT + dT_min;

    cineq5_max = vertcat(cineq5_max, cineq5_max_sub);
    cineq5_min = vertcat(cineq5_min, cineq5_min_sub);
end

cineq5_max_v = jacobian(cineq5_max, v)
cineq5_min_v = jacobian(cineq5_min, v)
