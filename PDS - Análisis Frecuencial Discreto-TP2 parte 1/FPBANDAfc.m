function [PBANDA]=FPBANDAfc(w1,w2,N)
% Filtro pasa banda de fase cero

PBANDA=zeros(1,N);
PBANDA(1,w1:w2)=1;
PBANDA(1,(N-w2):(N-w1))=1;