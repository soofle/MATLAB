%% Ejercicio 18 - Decimaci�n
%%
% Se�al anal�gica: Xa(t) = e^(-a*t)*u(t)

% Par�metros de prueba
Ts=0.1;
N=100;
a=0.8;
w=0:1/(N-1):1;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end

% Calculo la fft y el m�dulo y la fase de la fft de la se�al
X=fft(x);
Xmodulo=abs(X);
Xfase=angle(X);

% Gr�ficos
figure
subplot(3,1,1)
stem(w,x,'r');title('Se�al anal�gica'); 
xlabel('n'); ylabel('x[n]');
subplot(3,1,2)
stem(w,Xmodulo); title('M�dulo de la fft de la se�al')
xlabel('w'); ylabel('|X(w)|');
subplot(3,1,3)
stem(w,Xfase); title('Fase de la fft de la se�al')
xlabel('w'); ylabel('\phi(X(w))');

%%
clear();