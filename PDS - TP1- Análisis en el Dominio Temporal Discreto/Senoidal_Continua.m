function [y, tiempo]=Senoidal_Continua(fs,A,fo,fi,t0,tf)

%fs: Frecuencia de muestreo de la señal, la uso para muestrear
%A: Valor pico de la senoidal
%fo: Frecuencia de oscilación
%fi: Fase inicial
%t0: Tiempo inicial
%tf: Tiempo final

tiempo=t0:1/fs:tf;
y=A*sin(2*pi*fo*tiempo+fi);

%Gráfico
figure
plot(tiempo,y,'m')
title('Función senoidal')
xlabel('tiempo')
ylabel('x(t)')
hold all
stem(tiempo,y,'r')