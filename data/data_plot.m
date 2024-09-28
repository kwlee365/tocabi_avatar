clc
clear all
close all

zmp_bound_front_x  = 0.12;
zmp_bound_behind_x = 0.09;

data = readmatrix('MJ_graph.txt');
time = [1:1:length(data(:,1))] / 50;
zmp_ref_x = data(:,1);
zmp_opt_x = data(:,2);
tau_opt_y = data(:,3);
cam_init_y= data(:,4);
del_F_x   = data(:,5);
xi_ref_x  = data(:,6);
xi_mea_x  = data(:,7);

figure()
hold on
plot(time, zmp_ref_x, 'k', 'LineWidth', 1.5) 
plot(time, zmp_ref_x + zmp_bound_front_x, 'color', [0.5 0.5 0.5], 'LineWidth', 1.5) 
plot(time, zmp_ref_x - zmp_bound_behind_x, 'color', [0.5 0.5 0.5], 'LineWidth', 1.5) 
plot(time, zmp_opt_x, 'r', 'LineWidth', 1.5) 
plot(time, del_F_x, 'b', 'LineWidth', 1.5) 
plot(time, xi_mea_x - xi_ref_x, 'g', 'LineWidth', 1.5)


legend({'$z_x^{\mathrm{ref}}$', ...
        '$\overline{z}_x$' ...
        '$\underline{z}_x$', ...
        '$z_x^{\mathrm{des}}$', ...
        '$\Delta f_{x,1}$', ...
        '$\xi_{\mathrm{err},x}$'}, ...
        'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')

xlabel('Time [sec]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
ylabel('Displacement [m]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
xlim([4 20])
% pbaspect([8 2 1])
grid on

% tau
figure(2)
hold on
plot(time, tau_opt_y,  'Color', [1 0.5 0], 'LineWidth', 1.5);
ylabel('Moment [Nm]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
legend({'$\tau_{y}^{\mathrm{des}}$'}, 'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')
xlim([4 20])
pbaspect([8 2 1])
grid on

% foot
data = readmatrix('MJ_graph_foottra_x.txt');

del_F_x = data(:,1);
lfoot_x = data(:,2);
rfoot_x = data(:,3);
step_time    = data(:,5);

figure()
hold on
% plot(del_F_x)
plot(time, rfoot_x, 'Color', [1 0 1], 'LineWidth', 1.5)
plot(time, lfoot_x, 'Color', [0 1 1], 'LineWidth', 1.5)
ylabel('Displacement [m]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
legend({'$e_{R,x}^{\mathrm{ref}}$', '$e_{L,x}^{\mathrm{ref}}$'}, 'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')
xlim([4 20])
% pbaspect([8 2 1])
grid on


figure()
hold on
plot(time, step_time, 'Color', [1 0.5 0], 'LineWidth', 1.5)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
ylabel('Step time [s]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
legend({'$T$'}, 'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')
xlim([4 20])
pbaspect([8 2 1])
grid on

%% y axis
% close all
zmp_bound_y = 0.07;

data = readmatrix('MJ_graph1.txt');
time = [1:1:length(data(:,1))] / 50;
zmp_ref_y = data(:,1);
zmp_opt_y = data(:,2);
tau_opt_x = data(:,3);
cam_init_x= data(:,4);
del_F_y   = data(:,5);
xi_ref_y  = data(:,6);
xi_mea_y  = data(:,7);

figure()
hold on
plot(time, zmp_ref_y, 'k', 'LineWidth', 1.5) 
plot(time, zmp_ref_y + zmp_bound_y, 'color', [0.5 0.5 0.5], 'LineWidth', 1.5) 
plot(time, zmp_ref_y - zmp_bound_y, 'color', [0.5 0.5 0.5], 'LineWidth', 1.5) 
plot(time, zmp_opt_y, 'r', 'LineWidth', 1.5) 
plot(time, del_F_y, 'b', 'LineWidth', 1.5) 
plot(time, xi_mea_y - xi_ref_y, 'g', 'LineWidth', 1.5)


legend({'$z_y^{\mathrm{ref}}$', ...
        '$\overline{z}_y$' ...
        '$\underline{z}_y$', ...
        '$z_y^{\mathrm{des}}$', ...
        '$\Delta f_{y,1}$', ...
        '$\xi_{\mathrm{err},y}$'}, ...
        'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')

xlabel('Time [sec]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
ylabel('Displacement [m]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
xlim([4 20])
% pbaspect([8 2 1])
grid on

figure()
hold on
plot(time, tau_opt_x,  'Color', [1 0.5 0], 'LineWidth', 1.5);
ylabel('Moment [Nm]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
legend({'$\tau_{x}^{\mathrm{des}}$'}, 'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')
xlim([4 20])
pbaspect([8 2 1])
grid on

data = readmatrix('MJ_graph_foottra_y.txt');

del_F_y = data(:,1);
lfoot_y = data(:,2);
rfoot_y = data(:,3);
% step_time    = data(:,4);

figure()
hold on
plot(time, rfoot_y, 'Color', [1 0 1], 'LineWidth', 1.5)
plot(time, lfoot_y, 'Color', [0 1 1], 'LineWidth', 1.5)
ylabel('Displacement [m]', 'Interpreter', 'latex', 'FontName', 'Times New Roman')
legend({'$e_{R,y}^{\mathrm{ref}}$', '$e_{L,y}^{\mathrm{ref}}$'}, 'Interpreter', 'latex', 'FontSize', 12, 'FontName', 'Times New Roman')
xlim([4 20])
% pbaspect([8 2 1])
grid on

%% WBIK
% clear all
% close all
% clc
% 
% data = readmatrix('/home/kwan/data/tocabi/KW_graph_wbik3.txt');
% time = [1:1:length(data(:,1))]'
% 
% udot_cam        = data(:,[1:2]);
% Jq_cam_virtual  = data(:,[3:4]);
% Jq_cam_lower    = data(:,[5:6]);
% Jq_cam_upper    = data(:,[7:8]);
% actual_cam      = data(:,[9:10]);
% 
% figure()
% subplot(2,1,1)
% hold on
% plot(time, udot_cam(:, 1))
% plot(time, Jq_cam_upper(:, 1))
% plot(time, Jq_cam_lower(:, 1))
% plot(time, Jq_cam_virtual(:, 1))
% plot(time, Jq_cam_upper(:, 1) + Jq_cam_lower(:, 1) + Jq_cam_virtual(:, 1))
% title('cam')
% legend('des cam', 'upper cam', 'lower cam','virtual cam', 'sum')
% subplot(2,1,2)
% hold on
% plot(time, udot_cam(:, 2))
% plot(time, Jq_cam_upper(:, 2))
% plot(time, Jq_cam_lower(:, 2))
% plot(time, Jq_cam_virtual(:, 2))
% plot(time, Jq_cam_upper(:, 2) + Jq_cam_lower(:, 2) + Jq_cam_virtual(:, 2))
% legend()
% title('cam')
% 
% 
% data = readmatrix('/home/kwan/data/tocabi/KW_graph_wbik1.txt');
% time = [1:1:length(data(:,1))]'
% 
% q_dot_virtual     = data(:,[1:6]);
% q_dot_ref_virtual = data(:,[7:12]);
% 
% figure()
% subplot(3,1,1)
% hold on
% plot(time, q_dot_virtual(:,4))
% plot(time, q_dot_ref_virtual(:,4))
% legend()
% title('qdot')
% subplot(3,1,2)
% hold on
% plot(time, q_dot_virtual(:,5))
% plot(time, q_dot_ref_virtual(:,5))
% legend()
% subplot(3,1,3)
% hold on
% plot(time, q_dot_virtual(:,6))
% plot(time, q_dot_ref_virtual(:,6))
% legend()
% 
% data = readmatrix('/home/kwan/data/tocabi/KW_graph_wbik2.txt');
% 
% q_virtual         = data(:,[1:6]);
% q_ref_virtual     = data(:,[7:12]);
% 
% % figure()
% % subplot(3,1,1)
% % hold on
% % plot(time, q_virtual(:,1))
% % plot(time, q_ref_virtual(:,1))
% % legend()
% % title('q')
% % subplot(3,1,2)
% % hold on
% % plot(time, q_virtual(:,2))
% % plot(time, q_ref_virtual(:,2))
% % legend()
% % subplot(3,1,3)
% % hold on
% % plot(time, q_virtual(:,3))
% % plot(time, q_ref_virtual(:,3))
% % legend()
% 
% figure()
% subplot(3,1,1)
% hold on
% plot(time, q_virtual(:,4))
% plot(time, q_ref_virtual(:,4))
% legend()
% title('q')
% subplot(3,1,2)
% hold on
% plot(time, q_virtual(:,5))
% plot(time, q_ref_virtual(:,5))
% legend()
% subplot(3,1,3)
% hold on
% plot(time, q_virtual(:,6))
% plot(time, q_ref_virtual(:,6))
legend()