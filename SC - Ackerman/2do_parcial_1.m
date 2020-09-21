G= zpk([],[-1 -8],[3])

Gc= zpk([-4.71],[-0.01 -1 -8],[1])
k= rlocfind(Gc*G,-8+10*i) %Verifico el valor de K de la condición de módulo
%sisotool(G,Gc)
M= feedback(G*Gc,1)
%R= zpk([],[0],[1]);
%step(M*R);%respuesta a la Rampa