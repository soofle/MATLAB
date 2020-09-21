% Aproximación Exponencial:

function [A,C,R]=Ajuste_exponencial(X,Y)

[A,B,R]=Ajuste_lineal(X,log(Y));

C=exp(B);