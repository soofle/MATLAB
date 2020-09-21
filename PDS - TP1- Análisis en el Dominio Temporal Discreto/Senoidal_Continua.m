function [y, tiempo]=Senoidal_Continua(fs,A,fo,fi,t0,tf)

%fs: Frecuencia de muestreo de la se�al, la uso para muestrear
%A: Valor pico de la senoidal
%fo: Frecuencia de oscilaci�n
%fi: Fase inicial
%t0: Tiempo inicial
%tf: Tiempo final

tiempo=t0:1/fs:tf;
y=A*sin(2*pi*fo*tiempo+fi);

%Gr�fico
figure
plot(tiempo,y,'m')
title('Funci�n senoidal')
xlabel('tiempo')
ylabel('x(t)')
hold all
stem(tiempo,y,'r')