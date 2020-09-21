% ------- Este es un programa MATLAB para encontrar el tiempo de subida,
% tiempo de pico, sobreelongación máxima, y tiempo de asentamiento del
% sistema de segundo orden y sistemas de orden superior -------
% ------- En este ejemplo se supone que zeta%0.6 y wn%5 -------
num=[25];
den=[1 6 25];
t=0:0.005:5;
[y,x,t]=step(num,den,t);
r=1; while y(r)<1.0001; r=r+1; end;
tiempo-subida=(r-1)*0.005

[ymax,tp]=max(y);

tiempo-pico=(tp - 1)*0.005

sobreelongacion-max=ymax-1

s=1001; while y(s)>0.98 & y(s)<1.02; s=s - 1; end;
tiempo-asentamiento=(s-1)*0.005
