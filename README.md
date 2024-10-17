1. WBIK 초반에 Initialization 하였을 때, 토크 튀는 현상 방지하기 위하여, 0 ~ 1초 동안 torque_desired minmax_cut

2. PD gain이 시뮬레이션보다 실제 로봇 실험할 때 2~3배 높아서, 하체에 요구되는 토크가 월등히 높아진다.이로 인해, yaw 방향 slip이 발생함. 어떻게 해결할 수 있을까?

3. upperbody weight : 1.0 / pelv weight : 5.0 -> pelvis weight가 높아야 waist joint를 균형 제어에 많이 사용.

4. computefast thread에서 HQP 계산 시간이 오래 소요되어 계산 시간이 밀리는 경우, 다음 스텝의 joint position에 불연속이 발생 (dt가 매우 커지므로). 따라서, 적분 스텝을 hz_로 고정하여 불연속적으로 튀는 문제를 해결함.