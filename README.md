w_ux = 1000
w_bx = 3000
w_time = 1        
w_uy = 1000
w_by = 3000

# 20240723 Update

## Perturbation Test

X dir 240N 0.2sec (COMPLETE)
Y dir 500N 0.2sec (COMPLETE)

control_size_cam = 2

MJ_PELV_CTRL == true

Kp
30.0,       # v lfoot (walking in place)
10.0,       # w lfoot (walking in place)
30.0,       # v rfoot (walking in place)
10.0,       # w rfoot (walking in place)
22.0,       # vx com  (walking in place)
30.0,       # vy com  (walking in place)
30.0,       # vz com  (walking in place)

eps_         : 5.0
eps_terminal : 0.0

damp1 : 0.93 #  if you want to use upperbody more, please lower it.

damp2 : 1.0

## Obstacle Test

worldbody
    body mocap="true" pos="0.60 0.22 0.00" zaxis="0 0 1"
        geom size="0.05 0.05 0.010" type="box"/
    body mocap="true" pos="0.92 -0.23 0.00" zaxis="0 0 1">
        geom size="0.05 0.05 0.015" type="box"/>
    body mocap="true" pos="1.25 0.24 0.00" zaxis="0 0 1">
        geom size="0.05 0.05 0.020" type="box"/>
    body mocap="true" pos="1.55 -0.25 0.00" zaxis="0 0 1">
        geom size="0.05 0.05 0.025" type="box"/>
worldbody

<5cm up>

worldbody
    body mocap="true" pos="0.60 0.22 0.00" zaxis="0 0 1"
        geom size="0.05 0.05 0.015" type="box"/
    body mocap="true" pos="0.92 -0.24 0.00" zaxis="0 0 1"
        geom size="0.05 0.05 0.020" type="box"/
    body mocap="true" pos="1.18 0.27 0.00" zaxis="0 0 1"
        geom size="0.05 0.05 0.025" type="box"/
    body mocap="true" pos="1.48 -0.235 0.00" zaxis="0 0 1"
        geom size="0.05 0.05 0.030" type="box"/
worldbody

control_size_cam = 3

MJ_PELV_CTRL == true

Kp
10.0,       # v lfoot (obstacle)
50.0,       # w lfoot (obstacle)     
10.0,       # v rfoot (obstacle)
50.0,       # w rfoot (obstacle)

10.0,       # vx com (obstacle)
10.0,       # vy com (obstacle)
50.0,       # vz com (obstacle)

eps_         : 5.0
eps_terminal : 0.0

damp1 : 0.93 #  if you want to use upperbody more, please lower it.

damp2 : 1.0

<TODO>
- WAIST YAW RETURN (depracated)
- turn all the jacobian, cmm matrix into pre_q_desired?

# 20240928 Update

## ADD real_robot.launch in 'tocabi_controller'
- <rosparam command="load" file="$(find tocabi_avatar)/setting/setting_wbik.yaml" ns="/tocabi_controller"/> 