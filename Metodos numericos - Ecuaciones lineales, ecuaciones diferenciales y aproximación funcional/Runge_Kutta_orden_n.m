%Metodo de Runge Kutta de orden n

function [T,Y]=Runge_Kutta_orden_n(funcion_ec_dif,To,Tf,Yo,M)

h=(Tf-To)/M;
T=To:h:Tf;
Y=zeros(M+1,length(Yo));
Y(1,:)=Yo;

for k=1:M
    F1= feval(funcion_ec_dif,T(k),Y(k,:));
    F2= feval(funcion_ec_dif,T(k)+(h/2),Y(k,:)+ h * (F1/2));
    F3= feval(funcion_ec_dif,T(k)+(h/2),Y(k,:)+ h * (F2/2));
    F4= feval(funcion_ec_dif,T(k)+h,Y(k,:)+ h * F3);
    
    Y(k+1,:)=Y(k,:) + h*(F1+2*F2+2*F3+F4)/6;
end
