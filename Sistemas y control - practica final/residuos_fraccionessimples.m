num=[2 5 3 6];
den=[1 6 11 6];
[residuos,polos,kterminosdirectos]=residue(num,den);
%Queda B(s)/A(s)= residuo1/(s-polo1) + residuo2/(s-polo2) + residuo3/(s-polo3) + k_terminodirecto