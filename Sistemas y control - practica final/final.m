clear all
close all
clc

num=[0.025];
den=[1 2.61 1.28 0.12 1];

[A,B,C,D]=tf2ss(num,den)

Ahat=[A zeros(4,1);-C 0];
Bhat=[B;0];

ctrb=ctrb(Ahat,Bhat)

rango=rank(ctrb)
det=det(ctrb)


J=[-0.24+1i*0.32 -0.24-1i*0.32 -40 -70 -920];

k=acker(Ahat,Bhat,J)

