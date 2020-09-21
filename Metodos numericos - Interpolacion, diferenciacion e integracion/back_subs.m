function X=back_subs(A,B)
if nargin<2
        disp('Debe ingresar matriz triangular superior y vector independiente')
        return;
end

N=size(A,1);
X=zeros(N,1); %vector resultado
X(N)=B(N)/A(N,N); %vector inicial resultado

for k=N-1:-1:1
   X(k)=(B(k)-A(k,k+1:N)*X(k+1:N))/A(k,k);
end
