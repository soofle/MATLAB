function Ejercicio2

load PD_Pacientes.txt %abre el archivo con los datos de las variables
load VARIABLESejercicio2.mat %archivo generado luego de extraer los datos (ver explicación en informe)


tiempo, PresNTA, PresHTA, DNTA, DHTA; %variables iniciales obtenidos de PD_Pacientes.txt
DHTAdiastole, DNTAdiastole, PresHTAdiastole, PresNTAdiastole; %variables usadas para el ajuste

%Gráficos temporales
figure(1);
subplot(2,1,1);
plot(tiempo,PresNTA,'g',tiempo,PresHTA,'r');
legend('NTA','HTA');
xlabel('Tiempo[s]');
ylabel('Presión(t)[mmHg]');
title('Gráficos temporales');
subplot(2,1,2);
plot(tiempo,DNTA,'g',tiempo,DHTA,'r');
legend('NTA','HTA');
xlabel('Tiempo[s]');
ylabel('Diámetro (t)[mm]');

%Gráfico de los bucles presión-diámetro
figure(2);
plot(DNTA,PresNTA,'g',DHTA,PresHTA,'r');
legend('NTA','HTA');
xlabel('Diámetro[mm]');
ylabel('Presión(D)[mmHg]');
title('Bucles Presión–Diámetro');


%%%Ajuste lineal de las respuestas elásticas diastólicas

[An,Bn,rn]=Ajuste_lineal(DNTAdiastole',PresNTAdiastole'); %se trasponen las variables porque son vector columna y deben ser vector fila
%Valores obtenidos:
%An =73.9847
%Bn =-371.2948
%rn =0.9746
pn=An*DNTAdiastole+Bn; %RECTA DE AJUSTE

[Ah,Bh,rh]=Ajuste_lineal(DHTAdiastole',PresHTAdiastole');
%Valores obtenidos:
%Ah =200.7898
%Bh =-1.2416e+003
%rh =0.9746
ph=Ah*DHTAdiastole+Bh; %RECTA DE AJUSTE

figure(3);
plot(DNTA,PresNTA,'g',DHTA,PresHTA,'r',DNTAdiastole,pn,'--k',DHTAdiastole,ph,'--k');
legend('NTA','HTA');
xlabel('Diámetro[mm]');
ylabel('Presión(D)[mmHg]');
title('Ajuste lineal de las componentes elásticas diastólicas');

    %%%Intersección rectas de ajuste lineal
    %Las ecuaciones An*D0-P0=Bn y Ah*D0-P0=Bh conforman las matrices A y B. 
    A=[An -1;Ah -1]; 
    B=[Bn;Bh];
    [a0,b0]=triang_gauss(A,B);
    X=back_subs(a0,b0);

    Diametro=5:8; %creo un vector que contenga a ambos intervalos de los diametros (pacientes normo e hipertenso)para graficar
    figure(4);
    plot(Diametro,P1,'g',Diametro,P2,'r',X(1),X(2),'*'); %grafico las rectas de ajuste y el punto de interseccion
    legend('NTA','HTA');
    xlabel('Diámetro[mm]');
    ylabel('Presión(D)[mmHg]');
    title('Intersección de rectas de ajuste lineal');

%%%Ajuste exponencial de las respuestas elásticas diastólicas

[An2,Cn,rn2]=Ajuste_exponencial(DNTAdiastole',PresNTAdiastole');
%Valores obtenidos:
%An2 =0.9147
%Cn =0.2992
%rn2 =0.9782
pnexp=Cn*exp(An2*DNTAdiastole); %FUNCIÓN DE AJUSTE

[Ah2,Ch,rh2]=Ajuste_exponencial(DHTAdiastole',PresHTAdiastole');
%Valores obtenidos:
%Ah2 =1.8477
%Ch =4.2821e-004
%rh2 =0.9787
phexp=Ch*exp(Ah2*DHTAdiastole); %FUNCIÓN DE AJUSTE

figure(5);
plot(DNTA,PresNTA,'g',DHTA,PresHTA,'r',DNTAdiastole,pnexp,'--k',DHTAdiastole,phexp,'--k');
legend('NTA','HTA');
xlabel('Diámetro[mm]');
ylabel('Presión(D)[mmHg]');
title('Ajuste exponencial de las componentes elásticas diastólicas');
