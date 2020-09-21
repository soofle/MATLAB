function [y,tiempo]=Amortiguada(N,Ts,fo,A,alfa)

%N: Longitud de la se�al generada
%Ts: Per�odo de muestreo
%fo: Frecuencia de oscilaci�n
%A: Amplitud
%alfa: Exponente

tiempo=0:Ts:(N-1)*Ts; %Genero vector de tiempo
fs=1/Ts;
[u,tiempou]=Escalon_Unitario(N,fs,0);

y=A*sin(2*pi*fo*tiempo).*exp(-alfa*tiempo).*u;
