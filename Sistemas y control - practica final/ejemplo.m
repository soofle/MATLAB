clear all
close all
clc

num=[0.4];
den=[1 0.3 -0.9 -0.4];
[A,B,C,D]=tf2ss(num,den);

controlab=ctrb(A,B);
rango=rank(controlab);
det=det(controlab);

J=[-4+1i*3.96 -4-1i*3.96 -10];
k=acker(A,B,J);

figure(4)
step(A,B,C,D)

t = 0:0.01:4;
sys = ss(A-B*k, eye(3), eye(3), eye(3)); 
x = initial(sys,[1;0;0],t);
x1 = [1 0 0]*x';
x2 = [0 1 0]*x';
x3 = [0 0 1]*x';

figure(1)
plot(t,x1)

figure(2)
plot(t,x2)

figure(3)
plot(t,x3)