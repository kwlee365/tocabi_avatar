%% X dir
clc
clear all
close all


clc
clear all
close all

data = readmatrix('sensor_state1.txt');
time = [1:1:length(data(:,1))];

pelv_v_x = data(:,1);
pelv_v_y = data(:,2);
pelv_v_z = data(:,3);

data = readmatrix('sensor_state2.txt');
% time = [1:1:length(data(:,1))];

imu_a_x = data(:,1);
imu_a_y = data(:,2);
imu_a_z = data(:,3);

data = readmatrix('sensor_state3.txt');
% time = [1:1:length(data(:,1))];

imu_a_raw_x = data(:,1);
imu_a_raw_y = data(:,2);
imu_a_raw_z = data(:,3);

data = readmatrix('sensor_state4.txt');
% time = [1:1:length(data(:,1))];

mod_v_x = data(:,1);
mod_v_y = data(:,2);
mod_v_z = data(:,3);





figure()
plot(time, pelv_v_z);
hold on
plot(time, imu_a_z);
plot(time, imu_a_raw_z);
plot(time, mod_v_z);
legend("pelv v", "imu a", "imu a raw", "mod v")
