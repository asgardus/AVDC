close all
clear all
k_t=0.7356; %k_t for min acc_time is used for braking %0 %for acceleration and then change k_t in the loop
k_b=0;   %0.7268-optimum k_b for shortest braking dist   %0 for braking and change in loop %0.6 for acceleration and remains constant
d=1;
%for k_t=0.1:0.1:1 %rail
    %for k_t=0.7355:0.0001:0.736 Road_wet_acc_time
for k_b=0.7260:0.0002:0.7270  %braking
    for mu_select = 2;              % set friction to mu_select = 1 (dry road), 2 (wet 
                            % road) or 3 (snow) for road and 1 for rail
    initial;
    simOut = sim('slip_model_Student.mdl');
    figure(2);
    plot(wheel_x);
    hold on
    plot(veh_x);
    hold on
    figure(3);
    plot(wheel_x);
    hold on
    i=1;
    for i=1:length(veh_x.time)      %loop for finding shortest acceleration time #gives k_t
        if veh_x.Data(i) >= 25
            acc_t(d)=veh_x.time(i);
            wheel_t(d)=wheel_x.Data(i);
            break
        end
    end
    for j=i:length(veh_x.time)      %loop for finding shortest braking distance #gives k_b
        %j=i is used so that the time is obtained after reaching 25m/s,
        %subtract 3seconds to obtain braking time, and 3*25 m from the braking distance. 
        if veh_x.Data(j) <= 0.01
            b_t(d)=veh_x.time(j)-3; %the time taken from application of brake to vehicle halt
            b_d(d)=veh_dist.data(j)-75; %the dist taken from application of brake to vehicle halt
            wheel_b(d)=wheel_x.Data(j);
            sr.data(j)=0;
            
            break
        end
    end
    d=d+1;
    end
end
close(h)
figure(4);
plot(b_d)
