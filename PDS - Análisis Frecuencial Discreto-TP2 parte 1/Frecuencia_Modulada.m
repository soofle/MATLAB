function [y,tiempo]=Frecuencia_Modulada(N,Am,Ac,Ts,fm,fc)

%N: Longitud de la señal generada
%Am: Amplitud modulada
%Ac: Amplitud carrier
%Ts: Período de muestreo

tiempo=0:Ts:N*Ts; %Genero vector de tiempo

y=Ac*cos(2*pi*fc*tiempo+Am*sin(2*pi*fm*tiempo));
