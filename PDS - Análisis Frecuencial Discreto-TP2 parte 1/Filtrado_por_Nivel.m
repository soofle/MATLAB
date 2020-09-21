function [Xmodulo,Xf]=Filtrado_por_Nivel(x,L)
%x: Se�al a filtrar
%L: Nivel de filtrado
%Xmodulo: M�dulo de la TDF de la se�al
%Xf: filtrado de la TDF de la se�al

X=fft(x); %Transformo la se�al
N=length(X);
Xmodulo=abs(X);

%Filtrado de la se�al
for n=1:N
    if Xmodulo(n)<L
        Xf(n)=0;
    else
        Xf(n)=Xmodulo(n);
    end
end