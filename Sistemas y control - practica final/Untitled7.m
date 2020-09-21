% ***** En este programa se representan las Curvas de
% respuesta escalón de un sistema que tiene dos entradas
%(u1 y u2) y dos salidas (y1 y y2) *****
% ***** Se representa en primer lugar la curva de respuesta
% escalón cuando la entrada es u1. A continuación se
% representa la curva de respuesta escalón cuando la entrada
% es u2 *****
% ***** Introducir las matrices A, B, C, y D *****
A=[-1 -1;6.5 0];
B=[1 1;1 0];
C=[1 0;0 1];
D=[0 0;0 0];
% ***** Para representar la curva de respuesta escalón
% cuando la entrada es u1, introduzca la orden
% 'step(A,B,C,D,1)' *****
step(A,B,C,D,1)
grid
title ('Respuesta a un escalón: Entrada = u1 (u2 = 0)')
text(3.4, -0.06,'Y1')
text(3.4, 1.4,'Y2')
% ***** A continuación se representa la curva de respuesta
% escalón cuando la entrada es u2. Introduzca la orden
% 'step(A,B,C,D,2)' *****
step(A,B,C,D,2)
grid
title ('Respuesta a un escalón: Entrada = u2 (u1 = 0)')
text(3,0.14,'Y1')
text(2.8,1.1,'Y2')