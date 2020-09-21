function [y,tiempo]=Exponencial(N,Ts,A,alfa,t0)

%N: Longitud de la señal generada
%Ts: Período de muestreo
%A: Amplitud
%alfa: Exponente

tiempo=0:Ts:(N-1)*Ts; %Genero vector de tiempo
fs=1/Ts;
[u,tiempou]=Escalon_Unitario(N-t0,fs,t0);

y=A*exp(alfa*(tiempo-t0)).*u;