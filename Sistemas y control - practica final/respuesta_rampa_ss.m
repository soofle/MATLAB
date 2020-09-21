% --------------- Respuesta a una rampa unitaria ---------------
% ***** La respuesta a una rampa unitaria se obtiene a�adiendo una nueva
% variable de estado x3. La dimensi�n de la ecuaci�n de estado
% se ampl�a en uno *****
% ***** Introduzca las matrices A, B, C, y D de la ecuaci�n de estado original
% y la ecuaci�n de salida *****
A=[0 1;-1 -1];
B=[0; 1];
C=[1 0];
D=[0];
% ***** Introduzca las matrices A, B, C, y D de la nueva,
% ecuaci�n de estado ampliada y de la ecuaci�n de salida *****
AA=[A zeros(2,1);C 0];
BB=[B;0];
CC=[0 0 1];
DD=[0];
% ***** Introduzca la orden de respuesta a un salto:
% [z,x,t]%step(AA,BB,CC,DD) *****
[z,x,t]=step(AA,BB,CC,DD);
% ***** Para representar x3 a�ada la entrada rampa unitaria en la gr�fica
% introduciendo la siguiente orden: plot(t,x3,'o',t,t,'-') *****
x3=[0 0 1]*x'; 
plot(t,x3,'o',t,t,'-')
xlim([0 10])
ylim([0 10])
grid
title('Respuesta a una rampa unitaria')
xlabel('t Seg')
ylabel('Entrada y Salida')