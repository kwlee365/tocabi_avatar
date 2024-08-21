# Tocabi Avatar (Bipedal walking controller)

Contact Schedule Optimization (Nonlinear DCM MPC framework)

- computeslow: ZMP plan, ZMP control, IK ...

- computethread3: COM, DCM plan (Wieber MPC), Nonlinear DCM controlller (Suggested)

Check 5 things when you do real robot experiment whether it works or not.

1. Vertical foot position feedback term to make swing foot motion (getFootTrajectory_stepping - 19619, 19690)
2. COM position, velocity feedback term to make pelvis motion (getPelvTrajectory - 17280 - 17282)
3. swing foot orientation control (I tried to align the swingfoot with the support foot)
4. Pelvis orientation control (getPelvTrajectory - 17315, 17316)
5. YAML param check (getParameterYAML)
