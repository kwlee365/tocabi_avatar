%% CP-MPC

clc
clear all
close all

data = readmatrix('MJ_graph1.txt')

figure(1)
plot(data(:,1)) % ZMP Ref
hold on
grid on
plot(data(:,2)) % ZMP des
plot(data(:,5)) % del F
plot(data(:,6)) % DCM des
plot(data(:,7)) % DCM mea
legend()

figure(2)
plot(data(:,3)) % centroidal moment
ylim([-5 5])

%% WBIK

clc
clear all
close all

data = readmatrix('MJ_wbik.txt');

figure(4)
subplot(2,1,1)
plot(data(:,1)) % des
hold on
grid on
% plot(data(:,3)) % virtual
% plot(data(:,5)) % leg
% plot(data(:,7)) % upper
plot(data(:,9)) % total
legend()
subplot(2,1,2)
plot(data(:,2)) % des
hold on
grid on
% plot(data(:,4)) % virtual
% plot(data(:,6)) % leg
% plot(data(:,8)) % upperr
plot(data(:,10)) % total
legend()

data1 = readmatrix('MJ_qpoases1.txt');
data2 = readmatrix('MJ_qpoases2.txt');

figure()
plot(data1(:,1))
legend()
legend('h1')
title('qp status')
figure()
plot(data2(:,1))
legend('h2')
title('qp status')

figure()
plot(data1(:,2))
legend()
legend('h1')
title('iter num')
figure()
plot(data2(:,2))
legend('h2')
title('iter num')

%% Joint
clc
clear all
close all

figure()
data = readmatrix('MJ_qdot_fast.txt');
joint_num = 2;
plot(data(:, joint_num))    % mea
hold on
grid on
% plot(data(:, joint_num+6))  % des
plot(data(:, joint_num+12))  % des

legend('vel mea', 'vel des LPF')
title('qdot')

figure()
plot(data(:,19))
title('calc time')


%% traj test

data = readmatrix('MJ_traj_fast.txt');

figure(6)
plot(data(:,1))
hold on
grid on
plot(data(:,2))
plot(data(:,3))
plot(data(:,4))
plot(data(:,5))
plot(data(:,6))
legend()
title('lfoot')

figure(7)
plot(data(:,7))
hold on
grid on
plot(data(:,8))
plot(data(:,9))
plot(data(:,10))
plot(data(:,11))
plot(data(:,12))
legend()
title('rfoot')

figure(8)
plot(data(:,13))
hold on
grid on
plot(data(:,14))
plot(data(:,15))
legend()
title('com')

figure(9)
plot(data(:,16))
hold on
grid on
plot(data(:,17))
plot(data(:,18))
plot(data(:,19))
plot(data(:,20))
plot(data(:,21))
legend()
title('lhand')

figure(10)
plot(data(:,22))
hold on
grid on
plot(data(:,23))
plot(data(:,24))
plot(data(:,25))
plot(data(:,26))
plot(data(:,27))
legend()
title('rhand')


figure(11)
plot(data(:,28))
hold on
grid on
plot(data(:,29))
plot(data(:,30))
legend()
title('upperbody')
