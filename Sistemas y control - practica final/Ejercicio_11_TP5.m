%% Trabajo Práctico N°5 Ejercicio 11 %%

close all 
clear all
clc

alpha=[2 10 15];

NUM=24;
DEN=[1 2 2];
for k=1:3
    
    DEN_verd=conv([1 alpha(k)],DEN);
    
    figure();
    step(NUM,DEN_verd);
    hold on;
    
    NUM_aprox=NUM/alpha(k);
    DEN_aprox=DEN;
    step(NUM_aprox,DEN_aprox);
    hold off;
    
    title(strcat('alpha= ',num2str(alpha(k))));
    
    legend('Respuesta verdadera','Respuesta aproximada');
    xlabel('tiempo');
    ylabel('Amplitud');

end