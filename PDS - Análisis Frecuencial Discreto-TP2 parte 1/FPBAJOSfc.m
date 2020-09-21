function [PBAJOS]=FPBAJOSfc(w1,N)
% Filtro pasa bajos de fase cero

PBAJOS=zeros(1,N);
PBAJOS(1,1:w1)=1;
PBAJOS(1,(N-w1):N)=1;