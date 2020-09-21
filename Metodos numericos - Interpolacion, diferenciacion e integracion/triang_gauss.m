%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Triangulación gaussiana con pivoteo parcial
%con sustitucion hacia atras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Objetivo: elementos nulos por debajo de la 
%diagonal principal (por debajo del elemento App)

%Metodo: Utilizar un multiplicador

%Pivoteo: Extraer el elemento con maximo valor de la columna y
%e intercambiar las filas para que quede en la diagonal

function [A_n,B_n]=triang_gauss(A,B)

if nargin<2
    disp('Ingrese una matriz cuadrada y un vector')
end


N=length(B);
aux=zeros(1,N);
Au=zeros(N,N+1);
Au=[A B];

for p=1:N-1   % Recorre la diagonal
    
    %Pivoteo
    [Y,j]=max(abs(Au(p:N,p)));  %Y=valor, j=posicion (fila)
    %Intercambiar fila p por j
    aux=Au(p,:);
    Au(p,:)=Au(j+p-1,:);
    Au(j+p-1,:)=aux;
    
    for r=p+1:N
    mult=Au(r,p)/Au(p,p);
        Au(r,p:N+1)=Au(r,p:N+1)-mult*Au(p,p:N+1);
    end
end

A_n=Au(:,1:N);
B_n=Au(:,N+1);



    

