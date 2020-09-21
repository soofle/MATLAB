function [y,tiempo]=Escalon_Unitario(L,fs,t0)

if t0==0,
    for i=1:L
    y(i)=1;
    end
else
    for i=t0+1:1:L+t0,
    y(i)=1;
    end
end 

Ts=1/fs;
tiempo=0:1*Ts:((L-1+t0)*Ts);