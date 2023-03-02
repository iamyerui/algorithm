clc
clear
close all


d = 3.5;
P0 = [0, -d/2];
P1 = [25, -d/2];
P2 = [25, d/2];
P3 = [50, d/2];
P = [P0; P1; P2; P3];

Path=[];
n = length(P)-1;
for t=0:0.01:1
    tmp = [0,0];
    for i=0:n
        kc = factorial(n)/(factorial(n-i)*factorial(i));
        kt = (1-t)^(n-i)*t^i;
        tmp = tmp + kc*kt*P(i+1,:);
    end
    Path(end+1,:) = tmp;
end


d = 3.5;               % 道路标准宽度
W = 1.8;               % 汽车宽度
L = 4.7;               % 车长
figure
len_line = 50;

%% 画图
d = 3.5;               % 道路标准宽度
W = 1.8;               % 汽车宽度
L = 4.7;               % 车长

figure
len_line = 50;

% 画灰色路面图
GreyZone = [-5,-d-0.5; -5,d+0.5; len_line,d+0.5; len_line,-d-0.5];
fill(GreyZone(:,1),GreyZone(:,2),[0.5 0.5 0.5]);
hold on
fill([P0(1),P0(1),P0(1)-L,P0(1)-L],[-d/2-W/2,-d/2+W/2,-d/2+W/2,-d/2-W/2],'b')  

% 画分界线
plot([-5, len_line],[0, 0], 'w--', 'linewidth',2);  %分界线
plot([-5,len_line],[d,d],'w','linewidth',2);     %左边界线
plot([-5,len_line],[-d,-d],'w','linewidth',2);  %左边界线;

% 设置坐标轴显示范围
axis equal
set(gca, 'XLim',[-5 len_line]); 
set(gca, 'YLim',[-4 4]); 

% 绘制路径
% scatter(P(:,1),P(:,2),'g')
plot(P(:,1),P(:,2),'r');%路径点
scatter(Path(:,1),Path(:,2),200, '.b');%路径点

