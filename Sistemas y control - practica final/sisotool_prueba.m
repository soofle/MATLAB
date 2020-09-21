close all 
clear all
clc

G=zpk([],[-2+1i*2 -2-1i*2],1);
C=1; %compensador
H=1; %H unitaria
%sisotool(G,C,H);

%Transferencia a Lazo cerrado
Gc=zpk([-3 -10],[0],26.364);
Gtotal=G*Gc; %planta + control pid
M=feedback(Gtotal,H);

%Respuesta a la rampa?
rampa=zpk([],[0],1);
step(rampa*M)