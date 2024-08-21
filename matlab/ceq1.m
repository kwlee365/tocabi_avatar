clc
clear all
close all

%% Nonlinear DCM Error Dynamics
% TODO : (T_step_ref + dT1)^2 -> pow(T_step_ref + dT1, 2)
% TODO : (T_step_ref + dT2)^2 -> pow(T_step_ref + dT2, 2)
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

ceq1 = []

for i = 1:n_phi

    p_end_x  = v(9*(i-1) + 1);
    p_end_y  = v(9*(i-1) + 2);
    p_init_x = v(9*(i-1) + 3);
    p_init_y = v(9*(i-1) + 4);
    dU_x     = v(9*(i-1) + 5);
    dU_y     = v(9*(i-1) + 6);
    db_x     = v(9*(i-1) + 7);
    db_y     = v(9*(i-1) + 8);
    dT       = v(9*(i-1) + 9);

    T_step = T_step_ref + dT;

    if i > 1
        xi_init_x = v(9*(i-2) + 5) + v(9*(i-2) + 7);
        xi_init_y = v(9*(i-2) + 6) + v(9*(i-2) + 8);
    end

    if i == 1
        ceq1_x_sub = dU_x + db_x - ( p_end_x + (b / T_step) * (p_end_x - p_init_x) - (b / T_step_ref - b / T_step) * (p_end_ref_x - p_init_ref_x) + exp((T_step - t_step) / b) * (xi_err_x - (p_init_x + ((t_step + b) / T_step) * (p_end_x - p_init_x))) +(exp((T_step - t_step) / b) - exp((T_step_ref - t_step) / b)) * (xi_ref_x - p_init_ref_x) -(((t_step + b) / T_step) * exp((T_step - t_step) / b) - ((t_step + b) / T_step_ref) * exp((T_step_ref - t_step) / b)) * (p_end_ref_x - p_init_ref_x) ); 
        ceq1_y_sub = dU_y + db_y - ( p_end_y + (b / T_step) * (p_end_y - p_init_y) - (b / T_step_ref - b / T_step) * (p_end_ref_y - p_init_ref_y) + exp((T_step - t_step) / b) * (xi_err_y - (p_init_y + ((t_step + b) / T_step) * (p_end_y - p_init_y))) +(exp((T_step - t_step) / b) - exp((T_step_ref - t_step) / b)) * (xi_ref_y - p_init_ref_y) -(((t_step + b) / T_step) * exp((T_step - t_step) / b) - ((t_step + b) / T_step_ref) * exp((T_step_ref - t_step) / b)) * (p_end_ref_y - p_init_ref_y) );
    else
        ceq1_x_sub = dU_x + db_x - ( p_end_x + (b / T_step) * (p_end_x - p_init_x) - (b / T_step_ref - b / T_step) * (p_end_ref_x - p_init_ref_x) + exp(T_step / b) * (xi_init_x - p_init_x - (b / T_step) * (p_end_x - p_init_x)) +(exp(T_step / b) - exp(T_step_ref / b)) * (xi_ref_x - p_init_ref_x) -((b / T_step) * exp(T_step / b) - (b / T_step_ref) * exp(T_step_ref / b)) * (p_end_ref_x - p_init_ref_x) ); 
        ceq1_y_sub = dU_y + db_y - ( p_end_y + (b / T_step) * (p_end_y - p_init_y) - (b / T_step_ref - b / T_step) * (p_end_ref_y - p_init_ref_y) + exp(T_step / b) * (xi_init_y - p_init_y - (b / T_step) * (p_end_y - p_init_y)) +(exp(T_step / b) - exp(T_step_ref / b)) * (xi_ref_y - p_init_ref_y) -((b / T_step) * exp(T_step / b) - (b / T_step_ref) * exp(T_step_ref / b)) * (p_end_ref_y - p_init_ref_y) );
    end

    ceq1 = vertcat(ceq1, ceq1_x_sub)
    ceq1 = vertcat(ceq1, ceq1_y_sub)
end

ceq1_v = jacobian(ceq1, v)
