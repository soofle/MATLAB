%% Ejercicio 18 - Decimación
%%
% Señal analógica: Xa(t) = e^(-a*t)*u(t)

% Parámetros de prueba
Ts=0.1;
N=100;
a=0.8;
w=0:1/(N-1):1;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end

% Calculo la fft y el módulo y la fase de la fft de la señal
X=fft(x);
Xmodulo=abs(X);
Xfase=angle(X);

% Gráficos
figure
subplot(3,1,1)
stem(w,x,'r');title('Señal analógica'); 
xlabel('n'); ylabel('x[n]');
subplot(3,1,2)
stem(w,Xmodulo); title('Módulo de la fft de la señal')
xlabel('w'); ylabel('|X(w)|');
subplot(3,1,3)
stem(w,Xfase); title('Fase de la fft de la señal')
xlabel('w'); ylabel('\phi(X(w))');

%%
clear();