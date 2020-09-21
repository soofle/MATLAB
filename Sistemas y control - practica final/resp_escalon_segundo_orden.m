zita=0.52;
wn=40;

%G=tf([0 0 wn*wn],[1 2*zita*wn wn*wn]]);
%t = 0:0.5:4;
%step(num,den,t)

%[y,x,t] = step(num,den,t);
%Plot(t,y)
%grid
%title ('Respuesta a un escalón de amplitud 5')
%xlabel('t Seg')
%ylabel('Salida')

num = [40.48*40.48];
den = [1 2*0.52*48.40 40.48*40.48];
t = 0:0.01:1;
[y,x,t] = step(num,den,t)
plot(t,5*y)
grid
title ('Respuesta a un escalón de 5V')
xlabel('t Seg')
ylabel('Salida')
