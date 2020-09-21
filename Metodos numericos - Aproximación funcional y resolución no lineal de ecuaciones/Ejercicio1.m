function Ejercicio1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%   Descarga de datos   %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
datos=load('datos1.txt');

serie1_x=datos(:,1);
serie1_y=datos(:,2);
serie2_x=datos(:,3);
serie2_y=datos(:,4);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%   Ajuste Serie #1   %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%La funcion lsqcurvefit no permite ingresar valores de tipo flotante
%Redondeo de valores
serie1_xbis=round(serie1_x);
serie1_ybis=round(serie1_y);

%Ajuste
E=lsqcurvefit('Funcion_Ajuste_Serie1',[1 0],serie1_xbis,serie1_ybis);
Ajuste_serie1=E(1)*cosh(E(2)*serie1_x);

%Grafico de funcion de ajuste y nube de puntos
figure(1)
plot(serie1_x,serie1_y,'r*',serie1_x,Ajuste_serie1,'b')
title('Ajuste Serie #1')
legend('Nube de puntos','Función ajustada');
xlabel('Eje de abscisas');
ylabel('Eje de ordenadas');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%   Ajuste Serie #2   %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Utilizacion de funcion Ajuste_Polinomico
%C=[C(1) C(2) C(3) C(4) C(5)]       Orden decreciente
%P4(x)=C(1)*x^4 + C(2)*x^3 + C(3)*x^2 + C(2)*x + C(1)

C=Ajuste_Polinomico(serie2_x,serie2_y,4);   
Ajuste_serie2=C(1)*serie2_x.^4+C(2)*serie2_x.^3+C(3)*serie2_x.^2+C(4)*serie2_x+C(5);

%Grafico de funcion de ajuste y nube de puntos
figure(2)
plot(serie2_x,serie2_y,'r*',serie2_x,Ajuste_serie2,'b')
title('Ajuste Serie #2')
legend('Nube de puntos','Función ajustada');
xlabel('Eje de abscisas');
ylabel('Eje de ordenadas');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% INTERSECCION ENTRE FUNCIONES DE AJUSTE   %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ajuste_serie1=Ajuste_serie2

figure(3)
plot(serie1_x,Ajuste_serie1,'b',serie2_x,Ajuste_serie2,'r')
title('Funciones ajustadas')
legend('Función de ajuste serie #1','Función de ajuste serie #2');
xlabel('Eje de abscisas');
ylabel('Eje de ordenadas');

%Ubicacion estimada de raices
%1° Entre -10 y -6
%2° Entre -4 y 0
%3° Entre 4 y 8

n=length(serie1_y);
er=[10^(-6);10^(-9);10^(-12);10^(-6);10^(-9);10^(-12);10^(-6);10^(-9);10^(-12);10^(-6);10^(-9);10^(-12)];

%%%%%%%%%%%%%%%   RESOLUCION POR BOLZANO   %%%%%%%%%%%%%%%%%%%%%

for k=1:3
    r1x(k)=Metodo_Biseccion_TP('Funcion_Auxiliar',E,C,-10,-6,er(k));
    r2x(k)=Metodo_Biseccion_TP('Funcion_Auxiliar',E,C,-4,0,er(k));
    r3x(k)=Metodo_Biseccion_TP('Funcion_Auxiliar',E,C,4,8,er(k));
end



%%%%%%%%%%%%%   RESOLUCION POR FALSA POSICION   %%%%%%%%%%%%%%%%%

for k=4:6
    r1x(k)=Metodo_FalsaPosicion_TP('Funcion_Auxiliar',E,C,-10,-6,er(k));
    r2x(k)=Metodo_FalsaPosicion_TP('Funcion_Auxiliar',E,C,-4,0,er(k));
    r3x(k)=Metodo_FalsaPosicion_TP('Funcion_Auxiliar',E,C,4,8,er(k));
end




%%%%%%%%%%%%%%%%%   RESOLUCION POR SECANTE   %%%%%%%%%%%%%%%%%%%%%

P0=zeros(3);

n=length(serie1_x);
P0=Aprox_Inicial_TP(-10,serie1_x(n),1,er(1),'Funcion_Auxiliar',E,C);
P1=[P0(1)+0.1;P0(2)+0.1;P0(3)+0.1];

for k=7:9
    r1x(k)=Metodo_Secante_TP('Funcion_Auxiliar',E,C,er(k),P0(1),P1(1),100);
    r2x(k)=Metodo_Secante_TP('Funcion_Auxiliar',E,C,er(k),P0(2),P1(2),100);
    r3x(k)=Metodo_Secante_TP('Funcion_Auxiliar',E,C,er(k),P0(3),P1(3),100);
    
end


%%%%%%%%%%%%%   RESOLUCION POR NEWTON-RAPSON   %%%%%%%%%%%%%%%%%%%

for k=10:12
    r1x(k)=Metodo_NewtonRapson_TP('Funcion_Auxiliar','Funcion_Auxiliar_Derivada',E,C,P0(1),er(k),100);
    r2x(k)=Metodo_NewtonRapson_TP('Funcion_Auxiliar','Funcion_Auxiliar_Derivada',E,C,P0(2),er(k),100);    
    r3x(k)=Metodo_NewtonRapson_TP('Funcion_Auxiliar','Funcion_Auxiliar_Derivada',E,C,P0(3),er(k),100);
    
end


r1y=zeros(12);
r2y=zeros(12);
r3y=zeros(12);

%Calculo de punto en eje Y
for k=1:12
   for i=1:n
       if(abs(serie1_x(i)-r1x(k))<0.1)
           r1y(k)=serie1_y(i);
       end
       
       if(abs(serie1_x(i)-r2x(k))<0.1)
           r2y(k)=serie1_y(i);
       end
       
       if(abs(serie1_x(i)-r3x(k))<0.1)
           r3y(k)=serie1_y(i);
       end
   end
end



%Mostrar raices obtenidas en pantalla

disp('RAIZ #1 por BOLZANO')
disp(['Tolerancia 10^-6: ' '(' num2str(r1x(1)) ' ; ' num2str(r1y(1)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r1x(2)) ' ; ' num2str(r1y(2)) ')'])  
disp(['Tolerancia 10^-12: ' '(' num2str(r1x(3)) ' ; ' num2str(r1y(3)) ')'])

disp('RAIZ #1 por FALSA POSICION')
disp(['Tolerancia 10^-6: ' '(' num2str(r1x(4)) ' ; ' num2str(r1y(4)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r1x(5)) ' ; ' num2str(r1y(5)) ')'])  
disp(['Tolerancia 10^-12: ' '(' num2str(r1x(6)) ' ; ' num2str(r1y(6)) ')'])

disp('RAIZ #1 por SECANTE')
disp(['Tolerancia 10^-6: ' '(' num2str(r1x(7)) ' ; ' num2str(r1y(7)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r1x(8)) ' ; ' num2str(r1y(8)) ')']) 
disp(['Tolerancia 10^-12: ' '(' num2str(r1x(9)) ' ; ' num2str(r1y(9)) ')'])

disp('RAIZ #1 por NEWTON-RAPSON')
disp(['Tolerancia 10^-6: ' '(' num2str(r1x(10)) ' ; ' num2str(r1y(10)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r1x(11)) ' ; ' num2str(r1y(11)) ')']) 
disp(['Tolerancia 10^-12: ' '(' num2str(r1x(12)) ' ; ' num2str(r1y(12)) ')'])


disp('RAIZ #2 por BOLZANO')
disp(['Tolerancia 10^-6: ' '(' num2str(r2x(1)) ' ; ' num2str(r2y(1)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r2x(2)) ' ; ' num2str(r2y(2)) ')'])  
disp(['Tolerancia 10^-12: ' '(' num2str(r2x(3)) ' ; ' num2str(r2y(3)) ')'])

disp('RAIZ #2 por FALSA POSICION')
disp(['Tolerancia 10^-6: ' '(' num2str(r2x(4)) ' ; ' num2str(r2y(4)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r2x(5)) ' ; ' num2str(r2y(5)) ')'])  
disp(['Tolerancia 10^-12: ' '(' num2str(r2x(6)) ' ; ' num2str(r2y(6)) ')'])

disp('RAIZ #2 por SECANTE')
disp(['Tolerancia 10^-6: ' '(' num2str(r2x(7)) ' ; ' num2str(r2y(7)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r2x(8)) ' ; ' num2str(r2y(8)) ')']) 
disp(['Tolerancia 10^-12: ' '(' num2str(r2x(9)) ' ; ' num2str(r2y(9)) ')'])

disp('RAIZ #2 por NEWTON-RAPSON')
disp(['Tolerancia 10^-6: ' '(' num2str(r2x(10)) ' ; ' num2str(r2y(10)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r2x(11)) ' ; ' num2str(r2y(11)) ')']) 
disp(['Tolerancia 10^-12: ' '(' num2str(r2x(12)) ' ; ' num2str(r2y(12)) ')'])




disp('RAIZ #3 por BOLZANO')
disp(['Tolerancia 10^-6: ' '(' num2str(r3x(1)) ' ; ' num2str(r3y(1)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r3x(2)) ' ; ' num2str(r3y(2)) ')'])  
disp(['Tolerancia 10^-12: ' '(' num2str(r3x(3)) ' ; ' num2str(r3y(3)) ')'])

disp('RAIZ #3 por FALSA POSICION')
disp(['Tolerancia 10^-6: ' '(' num2str(r3x(4)) ' ; ' num2str(r3y(4)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r3x(5)) ' ; ' num2str(r3y(5)) ')'])  
disp(['Tolerancia 10^-12: ' '(' num2str(r3x(6)) ' ; ' num2str(r3y(6)) ')'])

disp('RAIZ #3 por SECANTE')
disp(['Tolerancia 10^-6: ' '(' num2str(r3x(7)) ' ; ' num2str(r3y(7)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r3x(8)) ' ; ' num2str(r3y(8)) ')']) 
disp(['Tolerancia 10^-12: ' '(' num2str(r3x(9)) ' ; ' num2str(r3y(9)) ')'])

disp('RAIZ #3 por NEWTON-RAPSON')
disp(['Tolerancia 10^-6: ' '(' num2str(r3x(10)) ' ; ' num2str(r3y(10)) ')'])
disp(['Tolerancia 10^-9: ' '(' num2str(r3x(11)) ' ; ' num2str(r3y(11)) ')']) 
disp(['Tolerancia 10^-12: ' '(' num2str(r3x(12)) ' ; ' num2str(r3y(12)) ')'])


figure(4)
plot(serie1_x,Ajuste_serie1,'b',serie2_x,Ajuste_serie2,'r',r1x(1),r1y(1),'g.',r2x(1),r2y(1),'y.',r3x(1),r3y(1),'m.')
title('Funciones ajustadas con intersecciones');
legend('Función de ajuste serie #1', 'Función de ajuste serie #2','Intersección:  (-8.1538 ; 13.8142)','Intersección:  (-1.4854 ; 2.61)','Intersección:  (6.6328 ; 9.5023))');
xlabel('Eje de abscisas');
ylabel('Eje de ordenadas');



      

% 
% %%%%%%%%%%%%%   COMPARACION DE METODOS   %%%%%%%%%%%%%%%%%%%
% %Raíz elegida para comparar: segunda raíz, ubicada entre -4 y 0
% %Los metodos deben cortar "por error deseado"
% %Los metodos deben mostrar la cantidad de iteraciones realizadas
% %Se utilizaron funciones modificadas para que brinde los datos
% necesitados

%METODO BISECCION
disp('Metodo Biseccion')
disp('Tolerancia 10^-6')
r2_1=Metodo_Biseccion_TP1('Funcion_Auxiliar',E,C,-4,0,er(1));
sprintf('Punto: (%.6f;%.6f)',r2_1,r2y(1))
disp('Tolerancia 10^-9')
r2_2=Metodo_Biseccion_TP1('Funcion_Auxiliar',E,C,-4,0,er(2));
sprintf('Punto: (%.9f;%.9f)',r2_2,r2y(2))
disp('Tolerancia 10^-12')
r2_3=Metodo_Biseccion_TP1('Funcion_Auxiliar',E,C,-4,0,er(3));
sprintf('Punto: (%.12f;%.12f)',r2_3,r2y(3))


%METODO FALSA POSICION
disp('Metodo Falsa posicion')
disp('Tolerancia 10^-6')
r2_4=Metodo_FalsaPosicion_TP1('Funcion_Auxiliar',E,C,-4,0,er(1));
sprintf('Punto: (%.6f;%.6f)',r2_4,r2y(4))
disp('Tolerancia 10^-9')
r2_5=Metodo_FalsaPosicion_TP1('Funcion_Auxiliar',E,C,-4,0,er(2));
sprintf('Punto: (%.9f;%.9f)',r2_5,r2y(5))
disp('Tolerancia 10^-12')
r2_6=Metodo_FalsaPosicion_TP1('Funcion_Auxiliar',E,C,-4,0,er(3));
sprintf('Punto: (%.12f;%.12f)',r2_6,r2y(6))


%METODO SECANTE
disp('Metodo Secante')
disp('Tolerancia 10^-6')
r2_7=Metodo_Secante_TP1('Funcion_Auxiliar',E,C,er(1),P0(2),P1(2),1000);
sprintf('Punto: (%.6f;%.6f)',r2_7,r2y(7))
disp('Tolerancia 10^-9')
r2_8=Metodo_Secante_TP1('Funcion_Auxiliar',E,C,er(2),P0(2),P1(2),1000);
sprintf('Punto: (%.9f;%.9f)',r2_8,r2y(8))
disp('Tolerancia 10^-12')
r2_9=Metodo_Secante_TP1('Funcion_Auxiliar',E,C,er(3),P0(2),P1(2),1000);
sprintf('Punto: (%.12f;%.12f)',r2_9,r2y(9))


%METODO NEWTON-RAPSON
disp('Metodo Newton-Rapson')
disp('Tolerancia 10^-6')
r2_10=Metodo_NewtonRapson_TP1('Funcion_Auxiliar','Funcion_Auxiliar_Derivada',E,C,P0(2),er(1),1000);
sprintf('Punto: (%.6f;%.6f)',r2_10,r2y(10))
disp('Tolerancia 10^-9')
r2_11=Metodo_NewtonRapson_TP1('Funcion_Auxiliar','Funcion_Auxiliar_Derivada',E,C,P0(2),er(2),1000);
sprintf('Punto: (%.9f;%.9f)',r2_11,r2y(11))
disp('Tolerancia 10^-12')
r2_12=Metodo_NewtonRapson_TP1('Funcion_Auxiliar','Funcion_Auxiliar_Derivada',E,C,P0(2),er(3),1000);
sprintf('Punto: (%.12f;%.12f)',r2_12,r2y(12))




end



