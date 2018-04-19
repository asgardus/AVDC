%% mass, spring and damper values and transfer function
M = 395;                     % mass in kg
K = 20000;                    % spring stiffness coeficient in N/m
C = 3800;                    % damping coefficient in Ns/m    
s = tf('s');                % LaPlace parameter
%% enter control parameters

KP = 6250;
KI = 66250;
KD = 0;
T = 1/(M*s^2+C*s+K);  
%% plot nyquist and pole zero maps for the system defined above

Ctrl = pid(KP,KI,KD);
S = feedback(Ctrl*T,1);
figure(1);
nyquist(S);
figure(2);
pzmap(T);