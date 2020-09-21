%% Ejercicio 24
%%
%Para probar el funcionamiento de la correlaci�n desarroll� dos funciones
%correlaci�n. Una, 'Correlacion.m', recibe las se�ales y las convoluciona
%directamente; la otra, 'CorrelacionTransformada', recibe las se�ales y
%aplica la Transformada Discreta de Fourier para realizar la correlaci�n en
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

%Gr�fico de las se�ales a correlacionar
figure
plot(n,x,'m',n,y,'r');title('Se�ales a correlacionar'); 
xlabel('w'); ylabel('Funci�n[w]');
%%
% Pruebo correlaci�n entre x e y y comparo con algoritmo predefinido en
% Matlab
[rseno]=Correlacion(x,y);
[rTseno]=CorrelacionTransformada(x,y);
[rmatlabseno]=xcorr(x,y);
%%
% Gr�ficos correlaci�n
figure
subplot(3,1,1)
plot(rseno);title('Funci�n Correlaci�n_x_y'); 
xlabel('n'); ylabel('Correlaci�n[n]');
subplot(3,1,2)
plot(rTseno);title('Funci�n Correlaci�nTransformada_x_y'); 
xlabel('n'); ylabel('Correlaci�n[n]');
subplot(3,1,3)
plot(rmatlabseno);title('Correlaci�n_x_y Matlab'); 
xlabel('n'); ylabel('Correlaci�n[n]');
%%
% Pruebo autocorrelaci�n de x y comparo con algoritmo predefinido en
% Matlab
[auto]=CorrelacionTransformada(x);
[automatlab]=xcorr(x);
%%
% Gr�ficos autocorrelaci�n
figure
subplot(2,1,1)
plot(auto);title('Autocorrelaci�n_x_x'); 
xlabel('n'); ylabel('Correlaci�n[n]');
subplot(2,1,2)
plot(automatlab);title('Autocorrelaci�n_x_x Matlab'); 
xlabel('n'); ylabel('Correlaci�n[n]');
%%
clear();