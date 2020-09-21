function [y,tiempo]=Amplitud_Modulada(N,Am,Ac,Ts,fm,fc)

%N: Longitud de la se�al generada
%Am: Amplitud modulada
%Ac: Amplitud carrier
%Ts: Per�odo de muestreo

tiempo=0:Ts:N*Ts; %Genero vector de tiempo

y=Ac+(1+(Am/Ac)*sin(2*pi*fm*tiempo)).*cos(2*pi*fc*tiempo);