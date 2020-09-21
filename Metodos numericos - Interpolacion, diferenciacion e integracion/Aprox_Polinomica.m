function C=Aprox_Polinomica(xk,yk,m)

X0=ones(1,m); %m: grado del polinomio
C=lsqcurvefit('funPol',X0,xk,yk)

end