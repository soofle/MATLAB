clear all
global nconsul; %Número de consultorios libres
nconsul=10;   % PROBAR CANTIDAD DE CONSULTORIOS

global Pac_atendidos;
Pac_atendidos=0;

global acumtespera;
acumtespera=0;

global esperaporpac;
esperaporpac=0;

global acumtesperamin;
acumtesperamin=0;

global esperaporpacmin;
esperaporpacmin=0;

%entrando= 300seg;
%saliendo= 120seg; 

%Hago una lista donde guardo los tiempos que esperaron los pacientes
%espera(1).paciente=0;       %HACER ACUMULADOR QUE ACUMULE TIEMPOS DE
%ESPERA Y DIVIDO POR CANT PACIENTES
    
%Cómo agregar pacientes: lista(2).estado=0 y lista(2).tiempo=0
%ESTADO;    0=ESPERANDO
%           1=ENTRANDO
%           2=ATENDIENDO
%           3=SALIENDO
%           4=ATENDIDO

%Crear una distribucion normal para los tiempos

%Tiempo de arribo durante el día
dia=makedist('Normal');   %dia.mu=M1 o dia.sigma=SD1
dia.mu=180; %3 minutos 
dia.sigma=60; %1 minuto

%Tiempo de arribo durante la noche
noche=makedist('Normal');   %noche.mu=M2 o noche.sigma=SD2
noche.mu=360; %6 minutos 
noche.sigma=120; %2 minutos

%Tiempo de atención
atencion=makedist('Normal');   %atencion.mu=M3 o atencion.sigma=SD3
atencion.mu=1500; %25 minutos 
atencion.sigma=600; %10 minutos

%   Se simula durante un día, el día, de 8 a 22Hs usa M1±DS1,
%   son 50400 segundos de 22 a 8Hs usa M2±DS2, son 36000 segundos

 rng('shuffle'); 

t_prox=0;
cont=1;

for t=0:24*60*60
    
    if(t == t_prox)     
        %genero un paciente
        lista(cont).estado = 0;
        lista(cont).tiempo = 0;
        cont = cont+1;
       
        %Si es de día tira tiempo random  de día, sino de  noche
        if (t<16*60*60)
            t_prox = t+floor(abs(random(dia)));     
        else
            t_prox=t+floor(abs(random(noche)));
        end
    end
    
%Recorrer la lista a ver si hay consultorio para asignarle

    for i=1:length(lista)
               
        %ESPERANDO
        if(lista(i).estado==0)
            
            if(nconsul~=0)                               %Si hay consultorio libre, pasa
                lista(i).estado=1;
                acumtespera=acumtespera+lista(i).tiempo;  
                %Grafica el acumtespera a medida que pasan las iteraciones
                    
                figure(1)
                hold on
                plot(t/60,acumtespera/length(lista)/60,'*')
                title('Tiempo de espera acumulado')
                ylabel('Acumulado [Min]')
                xlabel('Tiempo [Min]')
                
                lista(i).tiempo=5*60; %Tiempo que tarda en entrar al consultorio
                nconsul=nconsul-1;
            else
                lista(i).tiempo=lista(i).tiempo+1;    %No hay consul libre, sigue esperando
            end
            
        end
        
        %ENTRANDO
        if(lista(i).estado==1)
        
            if (lista(i).tiempo~=0)             %Sigue esperando no se agotaron los 5 min 
                lista(i).tiempo=lista(i).tiempo-1; 
            else
                lista(i).estado=2;          %Pasó a atenderse, ya entró
                lista(i).tiempo=floor(random(atencion));    %Le asigno tiempo random de atención        
        
            end    
        end    
           
        %ATENDIENDO
        if(lista(i).estado==2)
            
            if (lista(i).tiempo~=0)  %Aún no terminó de atenderse             
                lista(i).tiempo=lista(i).tiempo-1; 
            else
                lista(i).estado=3;     %Ya terminó de atenderse, sale     
                lista(i).tiempo=2*60; %Tiempo que tarda en salir del consultorio;
            end          
        end
        
        %SALIENDO
        if(lista(i).estado==3)
            
            if (lista(i).tiempo~=0)             %Sigue saliendo, hasta que se agote el tiempo de 2 min 
                lista(i).tiempo=lista(i).tiempo-1; 
            else
                lista(i).estado=4;          %Ya terminó de salir
                nconsul=nconsul+1;
                Pac_atendidos=Pac_atendidos+1;               
            end
        end
        
        %ATENDIDO es el estado 4.
        
    end
       
end

% contadorpac=0;

%Pac_atendidos debería ser = a todos los que tengan lista.estado=4
%for i=1:length(lista)

 %   if (lista(i).estado==4)
  %  contadorpac=contadorpac+1;
   % end
      
%end
  
esperaporpac=acumtespera/length(lista);  

esperaporpacmin=esperaporpac/60;

acumtesperamin=acumtespera/60;


