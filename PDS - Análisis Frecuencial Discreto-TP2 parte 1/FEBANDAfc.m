function [EBANDA]=FEBANDAfc(w1,w2,N)
% Filtro elimina banda de fase cero

EBANDA=zeros(1,N);
EBANDA(1,1:w1)=1;
EBANDA(1,w2:(N-w2))=1;
EBANDA(1,(N-w1):N)=1;