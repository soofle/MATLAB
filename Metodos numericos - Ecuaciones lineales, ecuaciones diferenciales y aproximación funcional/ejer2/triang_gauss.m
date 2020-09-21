%Triangulacion Gausseana
function [An,Bn]=triang_gauss(A,B)
N=size(A,1);
 Au=[A B];
     for p=1:N-1;
        for r=p+1:N;
            mult=Au(r,p)/Au(p,p);
            Au(r,p)=0; %para evitar el error
            for c=p+1:N+1;
                Au(r,c)=Au(r,c)-mult*Au(p,c);
            end
        end
    end
An=Au(:,1:N);
Bn=Au(:,N+1);



