function [y,tiempo]=Funcion_Sampling_Sinc(N,Ts,fo,t0)

%N: Longitud de la se�al generada
%Ts: Per�odo de muestreo
%fo: Frecuencia de oscilaci�n
%t0: Retardo

tiempo=0:Ts:N*Ts; %Genero vector de tiempo

y=(sin(2*pi*fo*(tiempo-t0)))./(2*pi*fo*(tiempo-t0));