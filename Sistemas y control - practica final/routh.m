GH=zpk([-1 -1],[0 0 0],1); %G*H para calcular criterio routh
[k,polos]=rlocfind(GH)