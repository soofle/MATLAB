% ***** Respuesta a escalón unitario de sistemas compensado y no compensado*****
num1=[12.287 23.876];
den1=[1 5.646 16.933 23.876];
num2=[9];
den2=[1 3 9];
num=[10];
den=[ 1 1 10];
t=0:0.05:5;
c1=step(num1,den1,t);
c2=step(num2,den2,t);
c=step(num,den,t);
plot(t,c1,'-',t,c2,'.',t,c,'x')
grid
title('Respuesta a escalón unitario de sistemas compensado y no compensado')
xlabel ('t Seg')
ylabel ('Salidas c1, c2 y c')
text (1.51,1.48,'Sistema compensado (Método 1)')
text (0.9,0.48,'Sistema compensado (Método 2)')
text (2.51,0.67,'Sistema no compensado')