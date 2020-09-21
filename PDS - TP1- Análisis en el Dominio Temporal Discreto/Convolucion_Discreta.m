function [y,M]=Convolucion_Discreta(x,h)

%x: Se�al de largo N1
%h: Se�al de largo N2

N1=length(x);
N2=length(h);

%Largo de la convoluci�n
M=N1+N2-1; 

%Lleno ambas se�ales con ceros hasta llegar al largo total necesario M
for i=1:M-N1,
    x(N1+i)=0;
end

for i=1:M-N2,
    h(N2+i)=0;
end   

%Invierto la se�al h
h_inv(1)=h(M);
for i=2:M
    h_inv(i)=h(M-i+1);
end

for i=1:M
    y(i)=sum(x.*circshift(h_inv,[0 i]));
end
