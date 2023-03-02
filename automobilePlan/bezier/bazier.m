clc
clear
close all


p0 = [0, 0];
p1 = [1, 1];
p = [p0; p1];
figure;

plot(p(:,1),p(:,2),'k');
% MakeGif('一次贝塞尔曲线.gif',1);
hold on

for t=0:0.01:1
    p_t = (1-t)*p0 + t*p1;
    scatter(p_t(1),p_t(2),200,'.r');
    stringName = "一次贝塞尔曲线：t ="+num2str(t);
    title(stringName);
%     MakeGif('一次贝塞尔曲线.gif',t*100+1);
end

% 二次贝塞尔曲线

p0 = [0,0];
p1 = [1,1];
p2 = [2,1];
p = [p0;p1;p2];

figure;
hold on

for t=0:0.01:1
    p_t1_1 = (1-t)*p0 +t*p1;
    p_t1_2 = (1-t)*p1 +t*p2;

%       h3 = plot([p_t1_1(1), p_t1_2(1)], [p_t1_1(2), p_t1_2(2)], 'g', 'linewidth',2);    
    p_t2 = (1-t)*p_t1_1 + t*p_t1_2;
    scatter(p_t2(1),p_t2(2),200,'.r');
    stringName = "二次贝塞尔曲线：t =" + num2str(t);
    title(stringName)
    
end



% 三次贝塞尔曲线
P0 = [0, 0];
P1 = [1, 1];
P2 = [2, 1];
P3 = [3, 0];
P = [P0; P1; P2; P3];
figure;
plot(P(:,1), P(:,2), 'k');

hold on

for t=0:0.01:1
   P_t_1_1 = (1-t)*P0 + t*P1;
    P_t_1_2 = (1-t)*P1 + t*P2;
    P_t_1_3 = (1-t)*P2 + t*P3;
    
    P_t_2_1 = (1-t)*P_t_1_1 + t*P_t_1_2;
    P_t_2_2 = (1-t)*P_t_1_2 + t*P_t_1_3;
    
     P_t_3 = (1-t)*P_t_2_1 + t*P_t_2_2;
       scatter(P_t_3(1), P_t_3(2), 300, '.r');
         stringName = "三次贝塞尔曲线：t =" + num2str(t);
    title(stringName)
end





