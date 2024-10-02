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

data1 = readmatrix('MJ_wbik.txt')
data2 = readmatrix('MJ_qdot_fast.txt')
data3 = readmatrix('MJ_traj_fast.txt')
data4 = readmatrix('MJ_q_fast.txt')

figure(4)
subplot(2,1,1)
plot(data1(:,1)) % des
hold on
grid on
plot(data1(:,3)) % virtual
plot(data1(:,5)) % leg
plot(data1(:,7)) % upper
plot(data1(:,9)) % total
legend()
subplot(2,1,2)
plot(data1(:,2)) % des
hold on
grid on
plot(data1(:,4)) % virtual
plot(data1(:,6)) % leg
plot(data1(:,8)) % upper
plot(data1(:,10)) % total
legend()

figure(5)
joint_num = 2;
plot(data4(:, joint_num))    % mea
hold on
grid on
plot(data4(:, joint_num+6))  % des
plot(data2(:, joint_num))    % mea
plot(data2(:, joint_num+6))  % des
legend('pos mea', 'pos des', 'vel mea', 'vel des')


figure(6)
plot(data3(:,1))
hold on
grid on
plot(data3(:,2))
plot(data3(:,3))
plot(data3(:,4))
plot(data3(:,5))
plot(data3(:,6))
legend()
title('lfoot')

figure(7)
plot(data3(:,7))
hold on
grid on
plot(data3(:,8))
plot(data3(:,9))
plot(data3(:,10))
plot(data3(:,11))
plot(data3(:,12))
legend()
title('rfoot')

figure(8)
plot(data3(:,13))
hold on
grid on
plot(data3(:,14))
plot(data3(:,15))
legend()
title('com')

figure(9)
plot(data3(:,16))
hold on
grid on
plot(data3(:,17))
plot(data3(:,18))
plot(data3(:,19))
plot(data3(:,20))
plot(data3(:,21))
legend()
title('lhand')

figure(10)
plot(data3(:,22))
hold on
grid on
plot(data3(:,23))
plot(data3(:,24))
plot(data3(:,25))
plot(data3(:,26))
plot(data3(:,27))
legend()
title('rhand')


figure(11)
plot(data3(:,28))
hold on
grid on
plot(data3(:,29))
plot(data3(:,30))
legend()
title('upperbody')
