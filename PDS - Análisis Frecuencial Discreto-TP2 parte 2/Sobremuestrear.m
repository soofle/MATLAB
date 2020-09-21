function [y,N]=Sobremuestrear(x,L)
%x: Vector generico
%L: Sobremuestreo genérico L

N=0:(length(x)*L)-1; %Largo vector resultado
y=zeros(1,length(N)); %Vector resultado

y(1)=x(1); %Primer elemento =

for(i=2:length(x))
    y(L*(i-1)+1)=x(i);
end