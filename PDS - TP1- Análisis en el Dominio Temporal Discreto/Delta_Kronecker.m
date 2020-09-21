function [y,tiempo]=Delta_Kronecker(L,fs)

y=zeros(1,L);
y(1)=1;
y(2:L)=0;

N=(L-1)*(1/fs);
Ts=1/fs;
tiempo=0:1/fs:N;