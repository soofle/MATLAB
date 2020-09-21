function Ejercicio1

%X=-1000:-1:-3;
%Y=1-2*X;
%figure(1);
%subplot(2,1,1);
%plot(X,Y,'g');
%legend('variable x','variable x2');
%xlabel('x');
%ylabel('F(x)');
%title('');


%---------------------------- ACA EMPIEZA
%Se determinan las condiciones de contorno para calcular los coeficientes
%a,b,c y d
%Funcion continua
A=[1 -3 9 27;1 4 16 64;0 1 -6 27;0 1 8 48]; %calculado por escrito; se incluyen las 4 condiciones de contorno
B=[7;29;-2;-32];

[a0,b0]=triang_gauss(A,B);
Coeficientes=sust_atras(a0,b0); %da el vector de coeficientes [a b c d]

%Tomo 4 puntos dentro de [-3,4]
%funcion:
%Coeficientes(1)+Coeficientes(2)*X+Coeficientes(3)*X^2+Coeficientes(3)*X^3

X=[-3 -1 2 4];
%puntos correspondientes a X del vector Y, ver otra forma de definir el vector
Y(1)=Coeficientes(1)+Coeficientes(2)*(-3)+Coeficientes(3)*(-3)^2+Coeficientes(4)*(-3)^3;
Y(2)=Coeficientes(1)+Coeficientes(2)*(-1)+Coeficientes(3)*(-1)^2+Coeficientes(4)*(-1)^3;
Y(3)=Coeficientes(1)+Coeficientes(2)*(2)+Coeficientes(3)*(2)^2+Coeficientes(4)*(2)^3;
Y(4)=Coeficientes(1)+Coeficientes(2)*(4)+Coeficientes(3)*(4)^2+Coeficientes(4)*(4)^3;

format long; %toma las variables con 15 decimales
ResultadoLagrange = Interp_Lagrange(X,Y);
ResultadoNewton=Newton(X,Y);