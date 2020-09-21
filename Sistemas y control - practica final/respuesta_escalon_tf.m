% ------------- Respuesta a un escalón unitario ----------- --
num = [25];
den = [1 4 25];
t = 0:0.01:3;
[y,x,t] = step(num,den,t)
plot(t,5*y)
grid
title ('Respuesta a un escalón unitario de G(s)=25/(sp2+4s+25)')
xlabel('t Seg')
ylabel('Salida')

%o simplemente con step(num,den,t)