function [y,n]=Senoidal_Discreta(Ni,Nf,A,w0,fi)

%Ni: Tiempo inicial
%Nf: Tiempo final
%A: Amplitud
%w0: Ángulo discreto entre 0<w0<pi
%fi: Fase entre 0<fi<2*pi

n=Ni:Nf;
y=A*sin(w0*n+fi);