function [y,tiempo]=Cuadrada(L,fs,P,A)

%L: Longitud de la secuencia
%fs: Frecuencia de muestreo
%P: Períodos
%A: Valor pico

N=L/P;
Ts=(2*pi)/N;
tiempo=0:Ts:(L-1)*Ts;
y=A*square(tiempo);