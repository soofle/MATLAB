function r=Metodo_FalsaPosicion_TP1(Funcion_Auxiliar,E,C,A,B,e)

for n=1:100
    
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
    
    if(abs(feval(Funcion_Auxiliar,c,E,C))<e)
        disp(['Por error deseado. Iteraciones: ' num2str(n)]);
        break;
    end
end


r=c;

end