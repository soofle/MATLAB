function [PALTOS]=FPALTOSfc(w1,N)
% Filtro pasa altos de fase cero

PALTOS=zeros(1,N);
PALTOS(1,w1:(N-w1))=1;