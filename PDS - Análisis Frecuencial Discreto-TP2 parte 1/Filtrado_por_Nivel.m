function [Xmodulo,Xf]=Filtrado_por_Nivel(x,L)
%x: Señal a filtrar
%L: Nivel de filtrado
%Xmodulo: Módulo de la TDF de la señal
%Xf: filtrado de la TDF de la señal

X=fft(x); %Transformo la señal
N=length(X);
Xmodulo=abs(X);

%Filtrado de la señal
for n=1:N
    if Xmodulo(n)<L
        Xf(n)=0;
    else
        Xf(n)=Xmodulo(n);
    end
end