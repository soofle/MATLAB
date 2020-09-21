close all 
clear all
clc

G=zpk([],[-3 -8],2);
C=zpk([-25 -3],[0],2);
H=1;

%sisotool(G,C,H)

Gtotal=G*C;
%lazo cerrado
M=feedback(Gtotal,H);
rampa=zpk([],[0],1);

step(rampa*M)
