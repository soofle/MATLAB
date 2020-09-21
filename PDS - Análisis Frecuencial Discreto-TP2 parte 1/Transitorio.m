function [posicion]=Transitorio(x,x_filtrada)

for n=1:150
    if x_filtrada(n)<=0.01*x(n)
       posicion=n;
       return
    end
end