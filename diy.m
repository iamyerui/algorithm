t=0.01:0.1:2;
L=length(t);

x=zeros(1,L);
y=x;

for i=1:L
    x(i)=t(i)^2;
    y(i)=x(i)+normrnd(0,0.1); 
    y2(i)=x(i)+normrnd(0,0.1); 
end


dt=0.1;

F2=[1,dt,0.5*dt^2;0,1,dt;0,0,1];%%%此处要注意矩阵是否病态，若dt特别小，易导致矩阵病态或精度丢失

H2=[1,0,0];

Q2=[1, 0, 0;0, 0.01, 0;0, 0,0.0001];

R2=1;


Xplus2=zeros(3,L);
Xplus2(1,1)=0.1^2;

Xplus2(2,1)=0;

Xplus2(3,1)=0;

Pplus2=[0.01, 0,0;0, 0.01,0;0,0,0.0001];


for i=2:L
    Xminus2=F2*Xplus2(:,i-1);
    Pminus2 = F2*Pplus2*F2'+ Q2;
    
    
    K2 = Pminus2*H2'*inv(H2*Pminus2*H2'+R2);
    Xplus2(:,i) = Xminus2 + K2*(y(i)-H2*Xminus2);
    Pplus2 = (eye(3) - K2*H2)*Pminus2;
end


F3=[1,dt,0.5*dt^2;0,1,dt;0,0,1];
H3=[1,0,0;1,0,0];
Q3=[1,0, 0;0,0.01,0;0,0,0.0001];
R3=[1,0;1,0];

Xplus3=zeros(3,L);

Xplus3(1,1)=0.1^2;

Xplus3(2,1)=0;

Xplus3(3,1)=0;

Pplus3=[0.01, 0,0;0, 0.01,0;0,0, 0.0001]; 

for i=2:L
    Xminus3 = F3*Xplus3(:,i-1);
    Pminus3 = F3*Pplus3*F3' + Q3;
    
    K3=Pminus3*H3'*inv(H3*Pminus3*H3'+R3);
    Y=zeros(2,1);

     Y(1,1)= y(i);

     Y(2,1)=y2(i);

     Xplus3(:,i)=Xminus3+K3*(Y-H3*Xminus3);
     Pplus3=(eye(3) - K3*H3)*Pminus3;
end
plot(t,x,'r',t, Xplus2(1,:), 'm','LineWidth',2); 




