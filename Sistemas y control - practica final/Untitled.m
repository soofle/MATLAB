%s=tf('s');
%g=(0.4)/(s^3+0.3*s^2-0.9*s-0.4)
%sisotool(g)

s=tf('s');
a=(9-3*s)/(s+1)/(s+7)
step(a)
hold on

anum=[-3 9];
aden=[1 8 7];
step(anum,aden)
