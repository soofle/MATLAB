function r = Aprox_Inicial_TP(a,b,dX,e,f,E,C)
x=[a:dX:b];
i=1;

N=length(x);


x(1)=a;
for k=2:N-1
    if(feval(f,x(k),E,C)*feval(f,x(k-1),E,C)<=0)
        r(i)=(x(k)+x(k-1))/2;
        i=i+1;
    end
    
    grad1 = feval(f,x(k),E,C)-feval(f,x(k-1),E,C);
    grad2 = feval(f,x(k+1),E,C)-feval(f,x(k),E,C); 
    
    if ((abs(feval(f,x(k),E,C))<e) && ((grad1*grad2)<0))
        r(i)=x(k);
        i=i+1;
    end
    
end