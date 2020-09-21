%% Ejercicio 25
%%
% Genero función x
N=1024;
fs=1000;
fo=1;
A=5;
n=1:N;
w0=2*pi*fo/fs;
x=A*cos(w0*n); xceros=[x zeros(1,1976)];  %Añado cant de ceros para que sea 
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
% Gráfico de la función que envío y la que recibo
figure
plot(n2,xceros,'b',n2,y,'r')
title('Señal enviada vs. eco recibido'); 
xlabel('n'); ylabel('Función[n]');
legend('x','y')
%%
% Calculo la correlación
[correlacion]=CorrelacionTransformada(xceros,y);
figure
plot(correlacion)
title('Correlación_x_y'); 
xlabel('n'); ylabel('Correlación[n]');
%%
% La distancia va a estar definida por la posición del vector correlación
% en la que está el valor máximo.
[valormax,posicion]=max(correlacion);

% Distancia
Distancia=(v/1000)*(posicion/fs)   %Paso la velocidad a km
%%
clear();