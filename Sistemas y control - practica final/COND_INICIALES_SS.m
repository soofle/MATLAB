t=0:0.05:3;
A=[0 1;-10 -5];
B=[0;0];
C=[0 0];
D=[0];
[y,x]=initial(A,B,C,D,[2;1],t);
x1=[1 0]*x';
x2=[0 1]*x';
plot(t,x1,'o',t,x1,t,x2,'x',t,x2)
grid
title('Respuesta a condición inicial')
xlabel('t Seg')
ylabel('Variables de estado x1 y x2')
gtext('x1')
gtext('x2')