%% Ejercicio 22 - Interpolación
%%
% Se observa que el bloque sobremuestreador agrega L componentes de
% alta frecuencia al espectro de Fourier de la señal.

% Señal analógica: Xa(t) = e^(-a*t)*u(t)

% Parámetros de prueba
Ts=0.1;
N=50;
a=0.8;
La=2; Lb=4; Lc=10;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end
%%
% Sobremuestreo la señal x[n]
va=Sobremuestrear(x,La);
vb=Sobremuestrear(x,Lb);
vc=Sobremuestrear(x,Lc);

% Transformo las señales
Xmodulo=abs(fft(x));
Vamodulo=abs(fft(va));
Vbmodulo=abs(fft(vb));
Vcmodulo=abs(fft(vc));
%%
% Gráficos
figure
subplot(2,2,1)
stem(Xmodulo);title('Módulo de la fft de la señal')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,2)
stem(Vamodulo);
title('Módulo de la fft de la señal sobremuestreada con L=2')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,3)
stem(Vbmodulo);
title('Módulo de la fft de la señal sobremuestreada con L=4')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,4)
stem(Vcmodulo);
title('Módulo de la fft de la señal sobremuestreada con L=10')
xlabel('w'); ylabel('|X(w)|');
%%
clear();