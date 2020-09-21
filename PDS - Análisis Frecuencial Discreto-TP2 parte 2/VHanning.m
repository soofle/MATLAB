function [w]=VHanning(N)

w=zeros(1,N);
n=0:N-1;
w=0.5*(1-cos((2*pi.*n)/(N-1)));