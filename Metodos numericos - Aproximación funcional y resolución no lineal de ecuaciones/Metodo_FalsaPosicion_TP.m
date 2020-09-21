function r=Metodo_FalsaPosicion_TP(Funcion_Auxiliar,E,C,A,B,e)

m=ceil(((log(abs(B-A))-log(e))/log(2)));


if(feval(Funcion_Auxiliar,A,E,C)*feval(Funcion_Auxiliar,B,E,C)>0)
    disp('No hay raices en el intervalo')
    r=0;
    return
end

for n=1:m
    
    c=B-feval(Funcion_Auxiliar,B,E,C)*(B-A)/(feval(Funcion_Auxiliar,B,E,C)-feval(Funcion_Auxiliar,A,E,C));
    
    if(feval(Funcion_Auxiliar,A,E,C)==0)
        r=A;
        break
    end
    
    if(feval(Funcion_Auxiliar,B,E,C)==0)
        r=B;
        break
    end
    
    
    if(feval(Funcion_Auxiliar,A,E,C)*feval(Funcion_Auxiliar,c,E,C)<0)
        A=A;
        B=c;
    end
    if(feval(Funcion_Auxiliar,B,E,C)*feval(Funcion_Auxiliar,c,E,C)<0)
        A=c;
        B=B;
    end
    
end
r=c;
end