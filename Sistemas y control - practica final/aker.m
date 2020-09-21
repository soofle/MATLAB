clear all
close all
clc

A=[-4 1;0 3];
B=[0;5];
C=[1 0];

Ahat=[A zeros(2,1);-C 0]
Bhat=[B;0];

ctrb=ctrb(Ahat,Bhat)

rango=rank(ctrb)
det=det(ctrb)

J=[-5+1i -5-1i -40];

k=acker(Ahat,Bhat,J)

