%% Ejercicio 24
%%
%Para probar el funcionamiento de la correlación desarrollé dos funciones
%correlación. Una, 'Correlacion.m', recibe las señales y las convoluciona
%directamente; la otra, 'CorrelacionTransformada', recibe las señales y
%aplica la Transformada Discreta de Fourier para realizar la correlación en
%espectro de frecuencia (lo pedido en el ejercicio).
%%
% Genero funciones para correlacionar
N=20;
fs=1000;
fo=50;
n=1:N;
w0=2*pi*fo/fs;
x=sin(w0*n);
y=sin(w0*n+pi/2);

%Gráfico de las señales a correlacionar
figure
plot(n,x,'m',n,y,'r');title('Señales a correlacionar'); 
xlabel('w'); ylabel('Función[w]');
%%
% Pruebo correlación entre x e y y comparo con algoritmo predefinido en
% Matlab
[rseno]=Correlacion(x,y);
[rTseno]=CorrelacionTransformada(x,y);
[rmatlabseno]=xcorr(x,y);
%%
% Gráficos correlación
figure
subplot(3,1,1)
plot(rseno);title('Función Correlación_x_y'); 
xlabel('n'); ylabel('Correlación[n]');
subplot(3,1,2)
plot(rTseno);title('Función CorrelaciónTransformada_x_y'); 
xlabel('n'); ylabel('Correlación[n]');
subplot(3,1,3)
plot(rmatlabseno);title('Correlación_x_y Matlab'); 
xlabel('n'); ylabel('Correlación[n]');
%%
% Pruebo autocorrelación de x y comparo con algoritmo predefinido en
% Matlab
[auto]=CorrelacionTransformada(x);
[automatlab]=xcorr(x);
%%
% Gráficos autocorrelación
figure
subplot(2,1,1)
plot(auto);title('Autocorrelación_x_x'); 
xlabel('n'); ylabel('Correlación[n]');
subplot(2,1,2)
plot(automatlab);title('Autocorrelación_x_x Matlab'); 
xlabel('n'); ylabel('Correlación[n]');
%%
clear();