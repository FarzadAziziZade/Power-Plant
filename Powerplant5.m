clc
C=input('mol of C= ');
H=input('mol of H= ');
S=input('mol of S= ');
O=input('mol of O= ');
N=input('mol of N= ');
H2O=input('mol of H2O= ');

MW=C*12+H+S*32+O*16+N*14+H2O*18;
c=12*C/MW;
H=1*H/MW;
S=32*S/MW;
O=16*O/MW;
N=14*N/MW;
H20=18*H2O/MW;