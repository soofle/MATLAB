%% Ejercicio 20 - Decimaci�n
%%
% Se�al anal�gica: Xa(t) = e^(-a*t)*u(t)

% Par�metros de prueba
Ts=0.1;
N=100;
a=0.8;
Ma=2; Mb=4; Mc=10;
% Valores de frecuencias de corte est�n normalizados
% si N=100 es equivalente a pi se obtiene que: (wcorte=pi/M)
wa=50; wb=25; wc=10;

w=0:1/(N-1):1;

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
% Gr�ficos obtenidos
figure
subplot(2,1,1)
stem(x);title('Se�al original');
xlabel('n');ylabel('x[n]');
subplot(2,1,2)
stem(w,X);title('fft de la se�al');
xlabel('w');ylabel('X(w)');

figure
subplot(3,1,1)
stem(w,V_wa);title('Se�al filtrada con filtro Pasa Bajos y wcorte=50');
xlabel('w');ylabel('V_wa(w)'); 
subplot(3,1,2)
stem(w,V_wb);title('Se�al filtrada con filtro Pasa Bajos y wcorte=25');
xlabel('w');ylabel('V_wb(w)');
subplot(3,1,3)
stem(w,V_wc);title('Se�al filtrada con filtro Pasa Bajos y wcorte=10');
xlabel('w');ylabel('V_wc(w)'); 
%%
clear();