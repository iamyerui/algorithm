t=0.1:0.01:2;
L=length(t);
x=zeros(1,L);
y=x;

for i=1:L
    x(i)=t(i)^2;
    y(i)=x(i)+normrnd(0,0.1); 
    y2(i)=x(i)+normrnd(0,0.1); 
end

F1=1;
H1=1;
Q1=1;
R1=1;
Xplus1=zeros(1,L);

Xplus1(1)=0.01;
Pplus1=0.01^2; 

for i=2:L
    Xminus1 = F1*Xplus1(i-1);
    Pminus1 = F1*Pplus1*F1' + Q1;
    K1=(Pminus1*H1')*inv(H1*Pminus1*H1'+R1);
    Xplus1(i)=Xminus1+K1*(y(i)-H1*Xminus1); 
    Pplus1=(1-K1*H1)*Pminus1;
end


dt=t(2)-t(1);

F2=[1,dt,0.5*dt^2;0,1,dt;0,0,1];%%%此处要注意矩阵是否病态，若dt特别小，易导致矩阵病态或精度丢失

H2=[1,0,0];

Q2=[1, 0, 0;0, 0.01, 0;0, 0,0.0001];

R2=1;

%%%设置初值%%%%

Xplus2=zeros(3,L);

Xplus2(1,1)=0.1^2;

Xplus2(2,1)=0;

Xplus2(3,1)=0;

Pplus2=[0.01, 0,0;0, 0.01,0;0,0,0.0001];

for i=2:L

Xminus2=F2*Xplus2(:,i-1);

 Pminus2=F2*Pplus2*F2'+Q2;

%%%更新步%%%%
%% 

 K2=(Pminus2*H2')*inv(H2*Pminus2*H2'+R2);

 Xplus2(:,i)=Xminus2+K2*(y(i)-H2*Xminus2);

 Pplus2=(eye(3)-K2*H2)*Pminus2;

end 


plot(t,x,'r',t,y,'g',t,Xplus1(1,:),'k',t, Xplus2(1,:), 'm','LineWidth',2); 

