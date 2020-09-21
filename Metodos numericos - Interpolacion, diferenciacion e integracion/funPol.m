function Y = funPol(X0,xk)

N=length(xk);
l=length(X0);
aux=0;
for k=1:N
    for u=1:l
        y(u)=X0(l)*xk(k)^(k-1)+aux;
        aux=y(u);
    end
    Y(k)=y(u);
end
end    