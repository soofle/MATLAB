%% Procesamiento Digital de Se�ales - TP1 - Sof�a Ayel�n Varela
%Colaboraciones: Agustina G�mez de la Fuente; Facundo Peloso.

%% Ejercicio 1

%DELTA DE KRONECKER
%[y,tiempo]=Delta_Kronecker(L,fs)
[deltak,tiempod]=Delta_Kronecker(100,20);
figure
stem(tiempod,deltak,'b')
title('Delta Kronecker')
xlabel('n')
ylabel('Y')
%%

%ESCALON UNITARIO
%[y,tiempo]=Escalon_Unitario(L,fs,t0)
[escalon,tiempoe]=Escalon_Unitario(100,20,5);
figure
stem(tiempoe,escalon,'m')
title('Escalon unitario')
xlabel('n')
ylabel('Y')
%%

%RAMPA UNITARIA
%[y,tiempo]=Rampa_Unitaria(L,fs)
[rampa,tiempor]=Rampa_Unitaria(100,20);
figure
stem(tiempor,rampa,'r')
title('Rampa unitaria')
xlabel('n')
ylabel('Y')
%%
clear all
%% Ejercicio 2

%DIENTE DE SERRUCHO
%[y,tiempo]=Diente_Serrucho(L,fs,P,A)
[diente,tiempod]=Diente_Serrucho(100,20000,13,7);
figure
stem(tiempod,diente,'c')
title('Diente de serrucho')
xlabel('n')
ylabel('Y')
%%

%FUNCI�N CUADRADA
%[y,tiempo]=Cuadrada(L,fs,P,A)
[cuadrada,tiempoc]=Cuadrada(100,20000,13,7);
figure
stem(tiempoc,cuadrada,'m')
title('Cuadrada')
xlabel('n')
ylabel('Y')
%%
clear all
%% Ejercicio 3

%SENOIDAL DISCRETA
%[y,n]=Senoidal_Discreta(Ni,Nf,A,w0,fi)

[sen1,n1]=Senoidal_Discreta(0,25,3,pi/17,0);
figure
stem(n1,sen1)
title('Senoidal discreta 1')
%%
[sen2,n2]=Senoidal_Discreta(-15,25,3,pi/17,0);
figure
stem(n2,sen2)
title('Senoidal discreta 2')
%%
[sen3,n3]=Senoidal_Discreta(-10,10,5,3*pi,pi/2);
figure
stem(n3,sen3)
title('Senoidal discreta 3')
%%
[sen4,n4]=Senoidal_Discreta(0,50,1,pi/sqrt(23),pi);
figure
stem(n4,sen4)
title('Senoidal discreta 4')
%%
clear all
%% Ejercicio 4

%SENOIDAL CONTINUA
%[y,tiempo]=Senoidal_Continua(fs,A,fo,fi,t0,tf)

%a)fs=10fo
Senoidal_Continua(100,4,5,0,0,10);
%No se observa con claridad el gr�fico
%%
%b)fs=4.5fo
Senoidal_Continua(100,4,2.25,0,0,10);
%Comienza a diferenciarse un poco la funci�n seno, pero aun se 
%observa con dificultad
%%
%c)fs=2fo
Senoidal_Continua(100,4,1,0,0,10);
%Ya se reconoce la funci�n seno, aunque los per�odos se observan cortos
%%
%d)fs=fo/3
Senoidal_Continua(100,10,1/6,0,0,10);
%Se reconoce claramente la funci�n seno
%%
clear all
%% Ejercicio 6

%%a)Desarrollo anal�tico

A = IMREAD('6a1.jpg'); 
figure;IMSHOW(A)
%%
B = IMREAD('6a2.jpg'); 
figure;IMSHOW(B)
%%
C = IMREAD('6a3.jpg'); 
figure;IMSHOW(C)
%%

%%b)
%Dk=Coeficientes vector y[n-k]
%Pk=Coeficientes vector x[n-k]

%ECUACI�N 1

D1=[1,0,0.9]; 
P1=[0.3,0.6,0.3]; 
%Defino vector X para filtrar
X1=zeros(1,128); %Vector respuesta al impulso h[n] es de largo N=128
X1(1)=1;
%Y=FILTER(B,A,X): Respuesta al impulso ante entrada delta[n]
Y1f=filter(P1,D1,X1);
%Respuesta al impulso utilizando la convoluci�n
Y1c=conv(X1,Y1f);

%ECUACI�N 2

D2=[1,1.8*cos(pi/16),0.81];
P2=[1,0.5,0];
%Defino vector X para filtrar
X2=zeros(1,128); %Vector respuesta al impulso h[n] es de largo N=128
X2(1)=1;
%Y=FILTER(B,A,X): Respuesta al impulso ante entrada delta[n]
Y2f=filter(P2,D2,X2);
%Respuesta al impulso utilizando la convoluci�n
Y2c=conv(X2,Y2f);

%Gr�fico ambas respuestas
figure
stem(Y1f,'m');
title('Respuesta al impulso h[n]');
xlabel('n');
ylabel('h[n]');
hold on
stem(Y1c,':','c');
hold off
%%
figure
stem(Y2f,'m');
title('Respuesta al impulso h[n]');
xlabel('n');
ylabel('h[n]');
hold on
stem(Y2c,':','c');
hold off
%%
clear all
%% Ejercicio 8

%AMPLITUD MODULADA
%[y,tiempo]=Amplitud_Modulada(N,Am,Ac,Ts,fm,fc)
[y_am,tiempo_am]=Amplitud_Modulada(512,10,5,1,1/200,1/20);
figure
subplot(2,3,1)
plot(tiempo_am,y_am,'g')
title('Amplitud Modulada')
xlabel('Tiempo')
ylabel('Y')

%FRECUENCIA MODULADA
%[y,tiempo]=Frecuencia_Modulada(N,Am,Ac,Ts,fm,fc)
[y_fm,tiempo_fm]=Frecuencia_Modulada(512,10,5,1,1/200,1/20);
subplot(2,3,2)
plot(tiempo_fm,y_fm,'b')
title('Frecuencia Modulada')
xlabel('Tiempo')
ylabel('Y')

%FUNCION SAMPLING (SINC)
%[y,tiempo]=Funcion_Sampling_Sinc(N,fs,fo,t0)
[y_sinc,tiempo_sinc]=Funcion_Sampling_Sinc(512,1,1/50,200);
subplot(2,3,3)
plot(tiempo_sinc,y_sinc,'r')
title('Funci�n Sampling (Sinc)')
xlabel('Tiempo')
ylabel('Y')

%AMORTIGUADA
%[y,tiempo]=Amortiguada(N,Ts,fo,A,alfa)
[y_amort,tiempo_amort]=Amortiguada(512,1,1/100,10,1/300);
subplot(2,3,4)
plot(tiempo_amort,y_amort,'m')
title('Amortiguada')
xlabel('Tiempo')
ylabel('Y')

%PULSO
%[y,tiempo]=Pulso(N,Ts,A,t0)
[y_pulso,tiempo_pulso]=Pulso(128,1,10,4);
subplot(2,3,5)
plot(tiempo_pulso,y_pulso,'c')
title('Pulso')
xlabel('Tiempo')
ylabel('Y')

%EXPONENCIAL
%function [y,tiempo]=Exponencial(N,Ts,A,alfa,t0)
[y_exp,tiempo_exp]=Exponencial(512,1,10,1/300,4);
subplot(2,3,6)
plot(tiempo_exp,y_exp,'b')
title('Exponencial')
xlabel('Tiempo')
ylabel('Y')

%%
clear all
%% Ejercicio 10
%Convoluci�n discreta de dos se�ales discretas

%Vectores de prueba, descriptos por la funci�n escal�n ya definida
[x,ti]=Escalon_Unitario(6,1,0);
[h,to]=Escalon_Unitario(3,1,5); 

%Pruebo la funci�n convoluci�n provista por Matlab (lineal)
C=conv(x,h);
figure
subplot(2,1,1)
stem(C,'m')
title('Funci�n CONV')
xlabel('n')
ylabel('y')

%Funci�n convoluci�n discreta desarrollada (circular)
[y,M]=Convolucion_Discreta(x,h);
subplot(2,1,2)
stem(y,'c')
title('Funci�n CONVOLUCION-DISCRETA')
xlabel('n')
ylabel('y')
%%

%Al probar con las distintas funciones definidas, no se observan 
%diferencias en ambos resultados, excepto para el caso de utilizar como 
%funci�n h la funcion de Sampling (sinc). 
clear all
%% Ejercicio 11
%Los archivos de audio se reproducen intercalados con los gr�ficos

%Abro archivo de audio y extraigo los datos
yaudio=wavread('graciastotales.wav');

%Tomo s�lo una de las columnas y convierto a vector fila
y=yaudio(:,1);
y=y';

%Primero normalizo el vector (con valores entre -1 y 1) para tener 
%valores positivos y la resoluci�n deseada; luego, realizo el proceso
%inverso para que sea un archivo reproducible con el comando sound().

%---1 bit de resoluci�n---

%Ajusto el vector con valores positivos. Sumo 1 para que el valor m�nimo
%quede positivo y divido por dos para ajustarlo al rango (0-1)
y1=round((y+1)./2); 
figure
subplot(2,1,1)
plot(y1(1:5000),'r')
title('Vector normalizado -1 bit-')
xlabel('Tiempo')
ylabel('y')

%Pasos inviersos para obtener se�al en formato deseado de salida
y1out=(y1.*2)-1;
subplot(2,1,2)
plot(y1out(1:5000),'b')
title('Vector de salida -1 bit-')
xlabel('Tiempo')
ylabel('y')
%%
%Reproducci�n del sonido con 1 bit de resoluci�n
sound(y1out,44100);

%---2 bits de resoluci�n---

%Ajusto el vector con valores positivos. Sumo 1 para que el valor m�nimo
%quede positivo y divido por dos para ajustarlo al rango (0-3). Multiplico
%por 3
y2=round(((y+1)./2)*3); 
figure
subplot(2,1,1)
plot(y2(1:5000),'r')
title('Vector normalizado -2 bits-')
xlabel('Tiempo')
ylabel('y')

%Pasos inviersos para obtener se�al en formato deseado de salida
y2out=((y2/3).*2)-1;
subplot(2,1,2)
plot(y2out(1:5000),'b')
title('Vector de salida -2 bits-')
xlabel('Tiempo')
ylabel('y')
%%
%Reproducci�n del sonido con 2 bits de resoluci�n
sound(y2out,44100);

%---4 bits de resoluci�n---

%Ajusto el vector con valores positivos. Sumo 1 para que el valor m�nimo
%quede positivo y divido por dos para ajustarlo al rango (0-15). Multiplico
%por 15
y4=round(((y+1)./2)*15); 
figure
subplot(2,1,1)
plot(y4(1:5000),'r')
title('Vector normalizado -4 bits-')
xlabel('Tiempo')
ylabel('y')

%Pasos inviersos para obtener se�al en formato deseado de salida
y4out=((y2/15).*2)-1;
subplot(2,1,2)
plot(y4out(1:5000),'b')
title('Vector de salida -4 bits-')
xlabel('Tiempo')
ylabel('y')
%%
%Reproducci�n del sonido con 4 bits de resoluci�n
sound(y4out,44100);

%---8 bits de resoluci�n---

%Ajusto el vector con valores positivos. Sumo 1 para que el valor m�nimo
%quede positivo y divido por dos para ajustarlo al rango (0-255). Multiplico
%por 255
y8=round(((y+1)./2)*255); 
figure
subplot(2,1,1)
plot(y8(1:5000),'r')
title('Vector normalizado -8 bits-')
xlabel('Tiempo')
ylabel('y')

%Pasos inviersos para obtener se�al en formato deseado de salida
y8out=((y8/255).*2)-1;
subplot(2,1,2)
plot(y8out(1:5000),'b')
title('Vector de salida -8 bits-')
xlabel('Tiempo')
ylabel('y')
%%
%Reproducci�n del sonido con 8 bits de resoluci�n
sound(y8out,44100);
clear all
%%-------------------------------------------------------------------------