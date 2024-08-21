clc
clear all
close all

syms xi_ref_x xi_ref_y
syms p_init_ref_x p_init_ref_y
syms p_end_ref_x p_end_ref_y
syms T_step_ref

syms xi_err_x xi_err_y
syms b

syms t_step

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

ceq2 = []

for i = 2:n_phi

    p_init_x = v(9*(i-1) + 3);
    p_init_y = v(9*(i-1) + 4);

    p_end_x_prev = v(9*(i-2) + 1);
    p_end_y_prev = v(9*(i-2) + 2);

    ceq2_x_sub = p_init_x - p_end_x_prev;
    ceq2_y_sub = p_init_y - p_end_y_prev;

    ceq2 = vertcat(ceq2, ceq2_x_sub)
    ceq2 = vertcat(ceq2, ceq2_y_sub)
end

ceq2_v = jacobian(ceq2, v)
