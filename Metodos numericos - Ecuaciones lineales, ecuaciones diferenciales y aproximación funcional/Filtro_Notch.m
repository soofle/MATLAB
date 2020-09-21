function Filtro_Notch()

t0=0;
tf=0.01;
M=1000;
x0=[0 0];

%[T,Y]=Runge_Kutta_orden_n(funcion_ec_dif,To,Tf,Yo,M)

[t,x]=Runge_Kutta_orden_n('Ec_Dif_Filtro_N',t0,tf,x0,M);

R1=50;
R2=50;
L=10*10^(-3);
C=10^(-6);
V=5;
w0=10000;
a1=(R1*R2)/((R1+R2)*L);
a0=1/(L*C);
b2=R2/(R1+R2);
b1=0;
b0=R2/((R1+R2)*L*C);

Vi=V*sin(w0*t);

CMATRIZ=[(b0-b2*a0) (b1-b2*a1)];
D=[b2];


V0=CMATRIZ*x'+D*Vi;
subplot(211)
plot(t,Vi,'r')
subplot(212)
plot(t,V0,'g');


%Calculo del tiempo en el que se extingue la salida del circuito

%V0=0.01*5



%Calculo de la frecuencia de las oscilaciones de la salida

%F1=1/(2*pi*(L*C)^(1/2))



