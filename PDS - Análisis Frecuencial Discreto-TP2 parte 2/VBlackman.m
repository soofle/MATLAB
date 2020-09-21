function [w]=VBlackman(N)

w=zeros(1,N);
for n=1:N
    w(n)=0.42-0.5*cos((2*pi*n)/(N-1))+0.08*cos((4*pi*n)/(N-1));
end
