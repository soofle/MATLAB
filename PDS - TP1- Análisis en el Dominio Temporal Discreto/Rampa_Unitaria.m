function [y,tiempo]=Rampa_Unitaria(L,fs)

for i=1:1:L,
y(i)=i;
end

N=(L-1)*(1/fs);
Ts=1/fs;
tiempo=0:1/fs:N;