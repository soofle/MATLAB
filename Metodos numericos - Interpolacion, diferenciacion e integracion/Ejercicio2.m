function Ejercicio2
%Defino los vectores correspondientes a la funci�n: X=y(m) y Y=g(m/s^2)
X=[0 30000 60000 90000 120000];
Y=[9.8100 9.7487 9.6879 9.6278 9.5682];

format long;
%POLINOMIO DE LAGRANGE
L=Interp_Lagrange(X,Y);
ResultadoLagrange=polyval(L,55000);

%POLINOMIO DE NEWTON
N=Newton(X,Y); %solo pido que devuelva los coeficientes
ResultadoNewton=polyval(N,55000);

%POLINOMIO DE APROXIMACION
P=Ajuste_Polinomico(X,Y,4);%NO ANDAAAAA no se usarlo
