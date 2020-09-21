function [y,tiempo]=Pulso(N,Ts,A,t0)

%N: Longitud de la señal generada
%Ts: Período de muestreo
%A: Amplitud
%t0: Retardo

tiempo=0:Ts:(N-1)*Ts; %Genero vector de tiempo
fs=1/Ts;
[u,tiempou]=Escalon_Unitario(N,fs,0);
[ut0,tiempout0]=Escalon_Unitario(N-t0,fs,t0); %Vector de u con retardo

y=A*(u-ut0);