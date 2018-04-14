%% mass, spring and damper values and transfer function
M = 395;                     % mass in kg
K = 20000;                    % spring stiffness coeficient in N/m
C = 3800;                    % damping coefficient in Ns/m    
s = tf('s');                % LaPlace parameter
%% plot the step response of the different controllers (P,PD,PI and PID)
KP = 6250;
KI = 66250;
KD = 0;
T = 1/(M*s^2+C*s+K);  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ctrl = pid(KP,KI,KD);
S = feedback(Ctrl*T,1);

nyquist(T);
pzmap(T);