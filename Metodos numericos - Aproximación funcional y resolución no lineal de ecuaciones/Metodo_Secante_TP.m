
function r = Metodo_Secante_TP(f,E,C,e,P0,P1,N)

for(k=1:N)
    P2 = P1 - feval(f,P1,E,C)*(P1-P0)/(feval(f,P1,E,C)-feval(f,P0,E,C));
    error = abs(P2-P1)/abs(P1);
    P0=P1;
    P1=P2;
    funcion_r=feval(f,P2,E,C);
    if((error < e) || (abs(funcion_r) < e) ) 
        break;
    end
    
end
r=P2;
end