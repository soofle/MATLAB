%% Ejercicio 25
%%
% Genero funci�n x
N=1024;
fs=1000;
fo=1;
A=5;
n=1:N;
w0=2*pi*fo/fs;
x=A*cos(w0*n); xceros=[x zeros(1,1976)];  %A�ado cant de ceros para que sea 
                                          %de largo=3000

D=5; %Distancia=5 km
v=1500; %Velocidad=1500 m/s
t=2*D*1000/v; %Tiempo

m=t*fs; %Cantidad de muestras, pasado a tiempo

n2=0:length(xceros)-1; %Vector para construir y; mismo largo que xceros
At=1;
alfa=10^(At/20);
r=randn(1,length(xceros));
xc=circshift(xceros,round(m));

y=exp(-alfa.*n2).*xc+r;
%%
% Gr�fico de la funci�n que env�o y la que recibo
figure
plot(n2,xceros,'b',n2,y,'r')
title('Se�al enviada vs. eco recibido'); 
xlabel('n'); ylabel('Funci�n[n]');
legend('x','y')
%%
% Calculo la correlaci�n
[correlacion]=CorrelacionTransformada(xceros,y);
figure
plot(correlacion)
title('Correlaci�n_x_y'); 
xlabel('n'); ylabel('Correlaci�n[n]');
%%
% La distancia va a estar definida por la posici�n del vector correlaci�n
% en la que est� el valor m�ximo.
[valormax,posicion]=max(correlacion);

% Distancia
Distancia=(v/1000)*(posicion/fs)   %Paso la velocidad a km
%%
clear();