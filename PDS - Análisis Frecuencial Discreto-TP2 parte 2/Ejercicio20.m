%% Ejercicio 20 - Decimación
%%
% Señal analógica: Xa(t) = e^(-a*t)*u(t)

% Parámetros de prueba
Ts=0.1;
N=100;
a=0.8;
Ma=2; Mb=4; Mc=10;
% Valores de frecuencias de corte están normalizados
% si N=100 es equivalente a pi se obtiene que: (wcorte=pi/M)
wa=50; wb=25; wc=10;

w=0:1/(N-1):1;

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
% Gráficos obtenidos
figure
subplot(2,1,1)
stem(x);title('Señal original');
xlabel('n');ylabel('x[n]');
subplot(2,1,2)
stem(w,X);title('fft de la señal');
xlabel('w');ylabel('X(w)');

figure
subplot(3,1,1)
stem(w,V_wa);title('Señal filtrada con filtro Pasa Bajos y wcorte=50');
xlabel('w');ylabel('V_wa(w)'); 
subplot(3,1,2)
stem(w,V_wb);title('Señal filtrada con filtro Pasa Bajos y wcorte=25');
xlabel('w');ylabel('V_wb(w)');
subplot(3,1,3)
stem(w,V_wc);title('Señal filtrada con filtro Pasa Bajos y wcorte=10');
xlabel('w');ylabel('V_wc(w)'); 
%%
clear();