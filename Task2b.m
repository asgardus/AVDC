close all
clear all
k_t=0.7356;
k_b=0.6;
d=1;
kt = [0.5:0.05:0.75];
for j=1:length(kt);
    k_t = kt(j);
    for mu_select = 2;              % set friction to mu_select = 1 (dry road), 2 (wet 
                            % road) or 3 (snow) for road and 1 for rail
    initial;
    simOut = sim('slip_model_Student.mdl');
    figure(2);
    plot(wheel_x);
    hold on
    plot(veh_x);
    hold on
    figure(5);
    plot(slip);
    hold on
    i=1;
    for i=1:length(veh_x.time)
        if veh_x.Data(i) >= 25
            acc_t(d)=veh_x.time(i);
            wheel_t(d)=wheel_x.Data(i);
            break
        end
    end
    d=d+1;
    end
end
close(h)
figure(4);
plot(acc_t)