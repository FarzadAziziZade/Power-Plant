clc
clear all
format long
C=input('mol of C= ');
H=input('mol of H= ');
S=input('mol of S= ');
O=input('mol of O= ');
N=input('mol of N= ');
H2O=input('mol of H2O= ');
x=input('percent of extra air /100 = ');
C=12.011*C;
H=1.008*H;
S=32.06*S;
O=16*O;
N=14.008*N;
H2O=18.016*H2O;
MW2=C+H+S+O+N+H2O;
disp('for products')
fprintf('%f  CO2   \n',C/12.011)
fprintf('%f  H2O   \n',H2O/18.016+H/2.016)
fprintf('%f  S2O   \n',S/32.06)
O2need=C/12.011+(H/2.016)/2+S/32.06-O/32;
N2product=O2need*(1+x)*3.76+N/28.016;
fprintf('%f  N2   \n',N2product)
fprintf('%f  O2   \n',O2need*x)
fprintf('%f  O2 we need   \n',O2need*(1+x))
totalp=N2product+S/32.06+H2O/18.016+H/2.016+C/12.011+O2need*x;
MW=C*(32+12.011)/12.011+H2O+H*18.016/2.016+S*(32.06+32)/32.06+N2product*28.016+O2need*x*32;
Mair=O2need*32+N2product*28.016;
totalW=MW;
fprintf('%f M of Products   \n',totalW/totalp)
fprintf('%f  M air / M fuel   \n',Mair/MW2)
fprintf('%f  M product / M air   \n',1+1/(Mair/MW2))
format short