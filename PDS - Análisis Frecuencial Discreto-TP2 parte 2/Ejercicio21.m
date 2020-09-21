%% Ejercicio 21 - Decimaci�n
%%
% Se observa una atenuaci�n en los �ltimos componentes del m�dulo respecto 
% al Ejercicio 19.

% Se�al anal�gica: Xa(t) = e^(-a*t)*u(t)

% Par�metros de prueba
Ts=0.1;
N=100;
a=0.8;
Ma=2; Mb=4; Mc=10;
wa=50; wb=25; wc=10;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end

% Transformada de la se�al a filtrar
X=fft(x);

% Filtro pasa bajos de fase cero para cada �ngulo de corte 
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
% Submuestreo las se�ales filtradas del Ejercicio 20
y_sa=Submuestrear(ifft(V_wa),Ma);
y_sb=Submuestrear(ifft(V_wb),Mb);
y_sc=Submuestrear(ifft(V_wc),Mc);
%%
% Transformada de Fourier de las se�ales filtradas submuestreadas
Y_sa=fft(y_sa);
Y_sb=fft(y_sb);
Y_sc=fft(y_sc);
%%
% Gr�ficos del m�dulo del espectro en amplitud de las transformadas
figure
subplot(3,1,1)
stem(abs(Y_sa));
title('M�dulo de la fft de la se�al submuestreada con M=2');
xlabel('w');ylabel('|Y(w)|'); 
subplot(3,1,2)
stem(abs(Y_sb));
title('M�dulo de la fft de la se�al submuestreada con M=4');
xlabel('w');ylabel('|Y(w)|'); 
subplot(3,1,3)
stem(abs(Y_sc));
title('M�dulo de la fft de la se�al submuestreada con M=10');
xlabel('w');ylabel('|Y(w)|'); 

%%
clear();