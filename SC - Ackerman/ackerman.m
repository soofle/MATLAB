%pongo la planta
A= [0 1;-8 -9];
B= [0;4];
C=[1 0];
D=[0];
controlabilidad= ctrb(A,B);
observabilidad= obsv(A,C);
rangoControlabilidad=rank(controlabilidad);
rangoObserbabilidad=rank(observabilidad);
%como rangoControlabilidad = n = rangoObserbabilidad es completamente
%controlable

Ah=[0 1 0;-8 -9 0;-1 0 0]
Bh=[0;3;0]
J=[-8+10*j -8-10*j -65]; %vector de los polos

K= acker(Ah,Bh,J) %vector de ganancias



