function [y,N]=Submuestrear(x,M)
%x: Vector gen�rico
%M: Submuestreo de intervalo M

N=0:(round(length(x)/M))-1; %largo vector
y=x(1:M:end);