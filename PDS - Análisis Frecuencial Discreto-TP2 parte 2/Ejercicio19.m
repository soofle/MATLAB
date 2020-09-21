%% Ejercicio 19 - Decimaci�n
%%
% Se�al anal�gica: Xa(t) = e^(-a*t)*u(t)

% Par�metros de prueba
Ts=0.1;
N=50;
a=0.8;
w=0:1/(N-1):1;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end
%%
% Submuestreo de la se�al x[n]
Ma=2; Mb=4; Mc=10;

xa=Submuestrear(x,Ma);
xb=Submuestrear(x,Mb);
xc=Submuestrear(x,Mc);

Xmodulo=abs(fft(x));
Xamodulo=abs(fft(xa));
Xbmodulo=abs(fft(xb));
Xcmodulo=abs(fft(xc));
%%
% Gr�ficos
figure
subplot(2,2,1)
stem(Xmodulo);title('M�dulo de la fft de la se�al')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,2)
stem(Xamodulo);title('M�dulo de la fft de la se�al submuestreada con M=2')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,3)
stem(Xbmodulo);title('M�dulo de la fft de la se�al submuestreada con M=4')
xlabel('w'); ylabel('|X(w)|');
subplot(2,2,4)
stem(Xcmodulo);title('M�dulo de la fft de la se�al submuestreada con M=10')
xlabel('w'); ylabel('|X(w)|');
%%
clear();