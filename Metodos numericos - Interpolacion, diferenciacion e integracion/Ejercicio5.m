function Ejercicio5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calcular velocidad inicial de la masa mediante Regla de Simpson compuesta
%y Regla trapezoidal compuesta
%v0=(2*F(x))^(1/2)
%F(x) es la integral de la funcion de la ley de movimiento entre 0 y b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


M=100;  %Cantidad de intervalos
b=0.4;  % Longitud libre del resorte


%Funcion externa: Funcion_Leydemovimiento(x) =>
%F(x)=u*g+(k/m)*(u*b+x)*(1-b/((b^2+x^2)^(1/2)));

%%%%%%%%%% Con Regla de Simpson compuesta %%%%%%%%%%%%
F1=Regla_Simpson_Compuesta('Funcion_Leydemovimiento',0,b,M);

%%%%%%%%%% Con Regla trapezoidal compuesta %%%%%%%%%%%%
F2=Regla_Trapezoidal_Compuesta('Funcion_Leydemovimiento',0,b,M);


v01=(2*F1)^(1/2);    %Con Simpson
v02=(2*F2)^(1/2);    %Con Trapezoidal

disp('Ejercicio 5: ')
s1=['Velocidad inicial con regla de Simpson compuesta: ' num2str(v01)];
s2=['Velocidad inicial con regla trapezoidal compuesta: ' num2str(v02)];
disp(s1)
disp(s2)
end