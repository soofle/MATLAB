function D = Tabla_Diferencias_Divididas(X,Y)

%Parametros de entrada: vectores X e Y, conteniendo el conj de abscisas y 
%ordenadas de los N+1 puntos a interpolar.
%Parametros de salida: Matriz D, tabla de diferencias divididas.

if nargin<2
    disp('Debe ingresar los vectores de abscisas y ordenadas X e Y');
    return;
end

N=length(X);        % Orden+1 del Polinomio a Interpolar
    
D=zeros(N,N);       %Matriz NxN con 0
D(:,1)=Y';          %Primera fila es el vector Y

for j=2:N %lleno de a columnas
    
    for k=j:N %empiza a partir del mismo nº de fila que columna
    D(k,j)=(D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1)); 
    end

end
