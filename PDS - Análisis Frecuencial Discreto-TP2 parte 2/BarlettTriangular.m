function [w]=BarlettTriangular(N)

w=zeros(1,N);

for n=1:(N/2)-1 
    w(n)=(2*n)/(N-1);
end

for n=(N/2)-1:N;
    w(n)=2-((2*n)/(N-1));
end