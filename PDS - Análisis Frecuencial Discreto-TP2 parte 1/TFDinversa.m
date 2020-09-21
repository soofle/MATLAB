function [x,n,re,im,m,f]=TFDinversa(X)

% Inversa de la Transformada de Fourier Discreta de una secuencia.
% X[k]: Transformada de Fourier Discreta compleja
% x[n]: Secuencia antitransformada
% re: Parte real de la secuencia
% im: Parte imaginaria de la secuencia
% m: Módulo de la secuencia
% f: Fase de la secuencia

N=length(X);

n=(0:N-1);

% Matriz de antitransformación
F=exp(1i*2*pi*(n'*n)/N);

x2=(X*F)*(1/N);

% Limpio los datos
re=real(x2); im=imag(x2);

x=re+1i*im;

m=abs(x);
f=angle(x);

% Si la TFD provino de una señal real, la parte imaginaria de su
% antitransformada debe ser 0 para todo n, entonces:
if imag(X)==0
    im(:)=0;
end    
