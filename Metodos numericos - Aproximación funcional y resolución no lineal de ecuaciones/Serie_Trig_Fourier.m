%Recibe solo un ciclo de la funcion a aproximar
function [T,Y]=Serie_Trig_Fourier(t,y,M)

N=length(y);    % Periodo
a=mean(y);      % Coef. a0/2
T=t;

for k=1:N
    suma=0;
    for i=1:M
        ai=0;
        bi=0;
        for m=1:N
            ai=ai+y(m)*cos(2*pi*m*i/N);
            bi=bi+y(m)*sin(2*pi*m*i/N);
        end
        suma=suma+(2/N)*ai*cos(2*pi*k*i/N)+(2/N)*bi*sin(2*pi*k*i/N);
    end
    Y(k)=a+suma;
end


end
