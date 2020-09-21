function Ejercicio2
%Función cuadrada


%M:Cantidad de puntos
N=1;
A=0;
B=600;
X=A:N:B;
M=length(X);

for k=1:M
    if(X(k)<100)
        Y(k)=10;
    end
    
    if(X(k)>=100 && X(k)<300)
        Y(k)=0;
    end
    
    if(X(k)>=300 && X(k)<400)
        Y(k)=10;
    end
    
    if(X(k)>=400)
        Y(k)=0;
    end
    
end

figure(5)
subplot(2,1,1)
plot(X,Y)
axis([0 600 -2 12])
title('Función a aproximar')



%Aproximacion por Serie trigonometrica de Fourier

%Pasar a la funcion solo un ciclo
X1=X(1:floor(M/2));
Y1=Y(1:floor(M/2));

f=length(X1);

Xm=X(1:M-1);

subplot(2,1,2)
for k=1:((f/2)-1)    
    [t,y]=Serie_Trig_Fourier(X1,Y1,k);
    ym=[y y];
    plot(Xm,ym,'b')
    s=['Orden: ' num2str(k)];
    title('Función aproximada con Serie Trigonométrica de Fourier')
    axis([0 600 -2 12])
    legend (s)
    pause(1/4)
end


end
