%Ecuacion diferencial del Filtro electrico
%V0''(t) + (R1*R2)/(R1+R2) * V0'(t) + 1/LC * V0(t) = R2/(R1+R2) Vi''(t) +
%R2/((R1+R2)*LC) * Vi(t)


%R1 = R2 = 50 ? , L = 10 mHy y C = 1 µF
%Vi(t) = V* sin (?0*t) , V = 5V   ?=10000(rad/s)

function Xp=Ec_Dif_Filtro_N(t,x)



R1=50;
R2=50;
L=10*10^(-3);
C=10^(-6);
V=5;
w0=10000;

Vi=V*sin(w0*t);

a1=(R1*R2)/((R1+R2)*L);
a0=1/(L*C);
b2=R2/(R1+R2);
b1=0;
b0=R2/((R1+R2)*L*C);

A=[0 1;-a0 -a1];
B=[0;1];

Xp=A*x'+B*Vi;
Xp=Xp';