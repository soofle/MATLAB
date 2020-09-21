function C=Ajuste_Polinomico(x,y,M)
%M: orden del polinomio a aproximar

N=length(x');

C=zeros(M+1,1); %Vector de coeficientes (en orden creciente)

D=zeros(N,M+1);

for j=1:M+1
    D(:,j)=(x').^(j-1);
end

A=D'*D;
B=D'*y;

[A_n,B_n]=triang_gauss(A,B);
C=sust_atras(A_n,B_n);

C=flipud(C);    %Se entregan en orden decreciente









end