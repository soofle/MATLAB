function r=Metodo_NewtonRapson_TP1(f,fderivada,E,C,P0,e,N)

for k=1:N
    P1 = P0 - feval(f,P0,E,C)/feval(fderivada,P0,E,C);
    error = abs(P1-P0)/abs(P0);
    P0=P1;
    funcion_r=feval(f,P1,E,C);
    
    if((error < e) || (abs(funcion_r) < e) ) 
        disp(['Por error deseado. Iteraciones: ' num2str(k)])
        break;
    end
end

r=P1;



end