function [w]=VHamming(N)

w=zeros(1,N);
for n=1:N
    w(n)=0.54-0.46*cos((2*pi*n)/(N-1));
end
