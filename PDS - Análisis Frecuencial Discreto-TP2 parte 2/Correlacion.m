function [r]=Correlacion(x,y)

if nargin==1 %Es la autocorrelaci�n
   y=x; 
end    

% Se debe flipear y luego implementar el complejo conjugado
% porque luego la convoluci�n la invierte de nuevo.

yflip=fliplr(y);
yconj=conj(yflip);

r=conv(x,yconj);