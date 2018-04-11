close all
clear all
% k_t=0.7356; 
% k_b=0.7268;
d=1;
pc=[1000000 50000];
% ic=[0 1 -1];
% dc=[-400 0 -350];
for k=1:2           % set friction to mu_select = 1 (dry road), 2 (wet road) or 3 (snow) for road and 1 for rail
% for j=1:length(pc);    
%     P_t=20000;
%     I_t=200;
%     D_t=1500;
%    
%     P_b=-10000;
%     D_b=0;
%     I_b=0;
p=pc(k)
%  i=ic(k)
% di=dc(k)
    initial;
    simOut = sim('slip_model_Student.mdl');


  figure(2);
   
    plot(wheel_x);
    hold on
    plot(veh_x);
    hold on


    for i=1:length(veh_x.time)      %loop for finding shortest acceleration time #gives k_t
        if veh_x.Data(i) >= 25
            acc_t(d)=veh_x.time(i);
            wheel_t(d)=wheel_x.Data(i);
            acc_d(d)=veh_dist.data(i);
            break
        end
    end
    for j=i:length(veh_x.time)      %loop for finding shortest braking distance #gives k_b
        %j=i is used so that the time is obtained after reaching 25m/s,
        %subtract 3seconds to obtain braking time, and 3*25 m from the braking distance. 
        if veh_x.Data(j) <= 0.000
            b_t(d)=veh_x.time(j)-(3+3.7696); %add acc_t when removing for loop %the time taken from application of brake to vehicle halt
            b_d(d)=veh_dist.data(j)-(75+45.7931); %add acc_d when removing for loop%the dist taken from application of brake to vehicle halt
            wheel_b(d)=wheel_x.Data(j);
           m=1
            
            break
        end
    end
    d=d+1;
end
% end
% close(h)
% figure(3);
% plot(acc_t)

figure(4);
plot(b_d)