%% Ejercicio 23 - Interpolaci�n
%%
% Se observa (en los gr�ficos del m�dulo del espectro de la se�al) 
% que la interpolaci�n de la se�al original se ha conseguido para todos 
% los valores de L.

% Se�al anal�gica: Xa(t) = e^(-a*t)*u(t)

% Par�metros de prueba
Ts=0.1;
N=100;
a=0.8;
La=2; Lb=4; Lc=10;

for n=1:N;
    x(n)=exp(-a*n*Ts);
end
%%
% Sobremuestreo la se�al x[n]
va=Sobremuestrear(x,La);
vb=Sobremuestrear(x,Lb);
vc=Sobremuestrear(x,Lc);
%%
% Transformo las se�ales sobremuestreadas
X=fft(x);
Va=fft(va);
Vb=fft(vb);
Vc=fft(vc);
%%
%Filtro pasa bajos de fase cero, se debe determinar �ngulo de corte
Na=length(Va);
PBa=zeros(1,Na);
n_wa=floor(Na/La);
PBa(1,1:n_wa)=1;

Nb=length(Vb);
PBb=zeros(1,Nb);
n_wb=floor(Nb/Lb);
PBb(1,1:n_wb)=1;

Nc=length(Vc);
PBc=zeros(1,Nc);
n_wc=floor(Nc/Lc);
PBc(1,1:n_wc)=1;
%%
% Aplico los filtros, salidas del sistema:
Ya=Va.*PBa;
Yb=Vb.*PBb;
Yc=Vc.*PBc;
%%

%Gr�ficos del m�dulo del espectro
w0=0:1/(N-1):1;
figure
subplot(2,2,1)
stem(w0,abs(X),'m'); title('M�dulo de la fft de la se�al')
xlabel('w'); ylabel('X(w)');
subplot(2,2,2)
stem(abs(Ya),'b');
title('M�dulo de la fft de la se�al sobremuestreada con L=2');
ylabel('Y_a(w)'); xlim([0 100]);
subplot(2,2,3)
stem(abs(Yb),'b'); 
title('M�dulo de la fft de la se�al sobremuestreada con L=4');
ylabel('Y_b(w)'); xlim([0 100]);
subplot(2,2,4)
stem(abs(Yc),'b'); 
title('M�dulo de la fft de la se�al sobremuestreada con L=10');
ylabel('Y_c(w)'); xlim([0 100]);
%%
clear();