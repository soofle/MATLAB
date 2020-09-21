%% Ejercicio 19 - Decimación
%%
% Señal analógica: Xa(t) = e^(-a*t)*u(t)

% Parámetros de prueba
Ts=0.1;
N=50;
a=0.8;
w=0:1/(N-1):1;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end
%%
% Submuestreo de la señal x[n]
Ma=2; Mb=4; Mc=10;

xa=Submuestrear(x,Ma);
xb=Submuestrear(x,Mb);
xc=Submuestrear(x,Mc);

Xmodulo=abs(fft(x));
Xamodulo=abs(fft(xa));
Xbmodulo=abs(fft(xb));
Xcmodulo=abs(fft(xc));
%%
% Gráficos
figure
subplot(2,2,1)
stem(Xmodulo);title('Módulo de la fft de la señal')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,2)
stem(Xamodulo);title('Módulo de la fft de la señal submuestreada con M=2')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,3)
stem(Xbmodulo);title('Módulo de la fft de la señal submuestreada con M=4')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,4)
stem(Xcmodulo);title('Módulo de la fft de la señal submuestreada con M=10')
xlabel('w'); ylabel('|X(w)|');
%%
clear();