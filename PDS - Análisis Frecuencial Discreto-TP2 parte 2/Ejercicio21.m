%% Ejercicio 21 - Decimación
%%
% Se observa una atenuación en los últimos componentes del módulo respecto 
% al Ejercicio 19.

% Señal analógica: Xa(t) = e^(-a*t)*u(t)

% Parámetros de prueba
Ts=0.1;
N=100;
a=0.8;
Ma=2; Mb=4; Mc=10;
wa=50; wb=25; wc=10;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end

% Transformada de la señal a filtrar
X=fft(x);

% Filtro pasa bajos de fase cero para cada ángulo de corte 
PBa=zeros(1,N);
PBa(1,1:wa)=1;
PBb=zeros(1,N);
PBb(1,1:wb)=1;
PBc=zeros(1,N);
PBc(1,1:wc)=1;
%%
% Salidas del sistema para Ma,Mb,Mc
V_wa=X.*PBa;
V_wb=X.*PBb;
V_wc=X.*PBc;

%%
% Submuestreo las señales filtradas del Ejercicio 20
y_sa=Submuestrear(ifft(V_wa),Ma);
y_sb=Submuestrear(ifft(V_wb),Mb);
y_sc=Submuestrear(ifft(V_wc),Mc);
%%
% Transformada de Fourier de las señales filtradas submuestreadas
Y_sa=fft(y_sa);
Y_sb=fft(y_sb);
Y_sc=fft(y_sc);
%%
% Gráficos del módulo del espectro en amplitud de las transformadas
figure
subplot(3,1,1)
stem(abs(Y_sa));
title('Módulo de la fft de la señal submuestreada con M=2');
xlabel('w');ylabel('|Y(w)|'); 
subplot(3,1,2)
stem(abs(Y_sb));
title('Módulo de la fft de la señal submuestreada con M=4');
xlabel('w');ylabel('|Y(w)|'); 
subplot(3,1,3)
stem(abs(Y_sc));
title('Módulo de la fft de la señal submuestreada con M=10');
xlabel('w');ylabel('|Y(w)|'); 

%%
clear();