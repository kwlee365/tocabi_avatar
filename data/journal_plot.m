%% X dir
clc
clear all
close all

data = readmatrix('KW_journal_data1_thread1.txt');

end_tick = length(data(:,1));

time  = [1:1:end_tick];

zmp_bound_front_x  = 0.17 * 0.7 * ones(end_tick, 1);
zmp_bound_behind_x =-0.13 * 0.7 * ones(end_tick, 1);

zmp_ctrl_x = data(time,1);
uT_x      = data(time,2);
dcm_ref_x = data(time,3);
dcm_mea_x = data(time,4);

dcm_err_x  = dcm_mea_x - dcm_ref_x;

figure()
h1 = plot(time, zmp_bound_front_x, 'color',  [0.5 0.5 0.5], 'LineWidth', 1.5) 
hold on
h2 = plot(time, zmp_bound_behind_x, 'color', [0.5 0.5 0.5], 'LineWidth', 1.5) 
h3 = plot(time, zmp_ctrl_x, 'r', 'LineWidth', 1.5) 
h4 = plot(time, uT_x,     'b', 'LineWidth', 1.5) 
h7 = plot(time, dcm_err_x,'g' ,'LineWidth', 1.5)
legend( [h3, h1, h2, h4, h7], ...
        {'$p_x^{\mathrm{ctrl}}$', ...
         '$\overline{p}_x$', ...
         '$\underline{p}_x$', ...
         '$u_{T,x,1}$', ...
         '$\xi_{\mathrm{err},x}$'}, ...
         'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')

xlabel('Time [sec]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
ylabel('Displacement [m]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
%xlim([0 315])
ylim([-0.2 0.5])
% pbaspect([8 2 1])
grid on

% Y dir
% clc
% clear all
% close all

data = readmatrix('KW_journal_data2_thread1.txt');

end_tick = length(data(:,1));

time = [1:1:end_tick];

zmp_bound_front_y  = 0.20 * 0.5 * 0.7 * ones(end_tick, 1);
zmp_bound_behind_y =-0.20 * 0.5 * 0.7 * ones(end_tick, 1);

zmp_ctrl_y = data(time,1);
uT_y       = data(time,2);
dcm_ref_y  = data(time,3);
dcm_mea_y  = data(time,4);

dcm_err_y  = dcm_mea_y - dcm_ref_y;

figure()
h1 = plot(time, zmp_bound_front_y, 'color',  [0.5 0.5 0.5], 'LineWidth', 1.5) 
hold on
h2 = plot(time, zmp_bound_behind_y, 'color', [0.5 0.5 0.5], 'LineWidth', 1.5) 
h3 = plot(time, zmp_ctrl_y, 'r', 'LineWidth', 1.5) 
h4 = plot(time, uT_y,     'b', 'LineWidth', 1.5) 
h7 = plot(time, dcm_err_y,'g' ,'LineWidth', 1.5)
legend( [h3, h1, h2, h4, h7], ...
        {'$p_y^{\mathrm{ctrl}}$', ...
        '$\overline{p}_y$', ...
        '$\underline{p}_y$', ...
        '$u_{T,y,1}$', ...
        '$\xi_{\mathrm{err},y}$'}, ...
        'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')

xlabel('Time [sec]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
ylabel('Displacement [m]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
% pbaspect([8 2 1])
grid on 

data = readmatrix('KW_journal_data_time_thread1.txt');
time = [1:1:length(data(:,1))] ;

T_ref = data(:,1);
T_new = data(:,2);
t_cur = data(:,3);

figure()
hold on
plot(time, T_ref, 'r', 'LineWidth', 1.5)
plot(time, T_new, 'g', 'LineWidth', 1.5)
plot(time, t_cur, 'b', 'LineWidth', 1.5)
ylabel('Displacement [m]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
legend({'$T_{\mathrm{ref}}$', '$T_{\mathrm{new}}$', '$t_{\mathrm{cur}}$'}, 'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')
% xlim([0 315])
% pbaspect([8 2 1])
grid on
% FOOT

clc
% clear all
% close all

data = readmatrix('KW_journal_foot_data1_thread1.txt');
time = [1:1:length(data(:,1))];

del_F_x = data(:,1);
lfoot_x = data(:,2);
rfoot_x = data(:,3);
lfoot_x_cur = data(:,4);
rfoot_x_cur = data(:,5);

figure()
hold on
% plot(time, del_F_x);
plot(time, lfoot_x);
plot(time, rfoot_x);
plot(time, lfoot_x_cur);
plot(time, rfoot_x_cur);
legend("lfoot", "rfoot", "lfoot cur", "rfoot cur")

data = readmatrix('KW_journal_foot_data2_thread1.txt');
time = [1:1:length(data(:,1))];

del_F_y = data(:,1);
lfoot_y = data(:,2);
rfoot_y = data(:,3);
lfoot_x_cur = data(:,4);
rfoot_x_cur = data(:,5);

figure()
hold on
% plot(time, del_F_y);
plot(time, lfoot_y);
plot(time, rfoot_y);
plot(time, lfoot_x_cur);
plot(time, rfoot_x_cur);
legend( "lfoot", "rfoot", "lfoot cur", "rfoot cur")

data = readmatrix('KW_journal_foot_data3_thread1.txt');
time = [1:1:length(data(:,1))];

lfoot_z = data(:,1);
rfoot_z = data(:,2);
lfoot_z_cur = data(:,3);
rfoot_z_cur = data(:,4);

figure()
hold on
plot(time, lfoot_z);
plot(time, rfoot_z);
plot(time, lfoot_z_cur);
plot(time, rfoot_z_cur);
legend("lfoot", "rfoot", "lfoot cur", "rfoot cur")

% clc
% clear all
% close all
% data = readmatrix('KW_journal_dynamics_score.txt');
% time = [1:1:length(data(:,1))];
% 
% figure()
% hold on
% plot(data(:,1))
% title('dynamics score x')
% legend()
% grid on
% 
% figure()
% hold on
% plot(data(:,2))
% title('dynamics score y')
% legend()
% grid on

%% ZMP_x

clc
clear all
% close all

data = readmatrix('KW_journal_data_analysis_x.txt');
time = [1:1:length(data(:,1))];

zmp_ref_x = data(:,1);
zmp_des_x = data(:,2);
com_x = data(:,3);
dcm_x = data(:,4);
dcm_mea_x = data(:,5);

figure()
hold on
plot(time, zmp_ref_x);
% plot(time, zmp_des_x);
plot(time, com_x);
plot(time, dcm_x);
plot(time, dcm_mea_x);
legend("zmp ref x",  "com x", "dcm x", "dcm mea x")
% legend("zmp ref x", "zmp des x", "com x", "dcm x", "dcm mea x")
% ZMP_y

clc
% clear all
% close all

data = readmatrix('KW_journal_data_analysis_y.txt');
time = [1:1:length(data(:,1))];

zmp_ref_y = data(:,1);
zmp_des_y = data(:,2);
com_y = data(:,3);
dcm_y = data(:,4);
dcm_mea_y = data(:,5);

figure()
hold on
plot(time, zmp_ref_y);
% plot(time, zmp_des_y);
plot(time, com_y);
plot(time, dcm_y);
plot(time, dcm_mea_y);
legend("zmp ref y",  "com y", "dcm y", "dcm mea y")
% legend("zmp ref y", "zmp des y", "com y", "dcm y", "dcm mea y")


%% Calc time

clc
% clear all
% close all

format long

data = readmatrix('KW_journal_data_calc_time.txt');
time = [1:1:length(data(:,1))];

calc_microsec = data(:,1);
calc_sec = 1e-6 * calc_microsec;
calc_hz  = 1 ./ calc_sec;

figure()
hold on
plot(time, calc_hz);
legend("calc time")
