function [C,D]=Newton(X,Y)
%Parametros de entrada: vectores X e Y, conteniendo el conj de abscisas y 
%ordenadas de los N+1 puntos a interpolar.
%Parametros de salida: Vector C, que contiene los coeficientes para el
%polinomio interpolatorio de Newton y una matriz D, que contiene la tabla
%de diferencias divididas.

if nargin<2
    disp('Debe ingresar los vectores de abscisas y ordenadas X e Y');
    return;
end

n=length(X);    % Orden+1 del Polinomio a Interpolar

D=Tabla_Diferencias_Divididas(X,Y);
A=diag(D);
M=zeros(n,n);
M(1,n)=A(1);
for k=2:n  %filas
    V=1;
    for l=1:k-1   %columna
        V=conv(V,poly(X(l)));
    end
    M(k,n-k+1:n)=A(k)*V;
end
C=sum(M);%me va sumando por columnas y me devuelve un vector
end    