function [X,k,Re,Im,M,F]=TFD(x)

% Funci�n que calcula la Transformada de Fourier Discreta de una secuencia.
% x[n]: Secuencia a transformar
% N: N�mero de elementos de la secuencia x
% X[k]: TFD de la secuencia
% k: Vector de elementos
% Re: Parte Real de la TFD
% Im: Parte Imaginaria de la TFD
% M: M�dulo de la TFD
% F: Fase de la TFD

N=length(x);

k=(0:N-1);

% Matriz de transformaci�n
F=exp(-1i*2*pi*(k'*k)/N);

X2=x*F;

% Limpio los datos
Re=real(X2); Im=imag(X2);

X=Re+1i*Im;

M=abs(X);
F=angle(X);