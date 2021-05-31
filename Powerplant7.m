clear all
clc
Vs1=input('Vs1= ');
tet1=input('tet1=');
kv=input('kv=');
mdot=input('mdot=');
gc=32.17;
VBopt=Vs1*cosd(tet1)/2;
VB=VBopt;
a=Vs1*sind(tet1);
b=Vs1*cosd(tet1)-VB;
fi1=atand(a/b);
Vr1=a/sind(fi1);
Vr2=kv*Vr1;
siy1=fi1;
del1=acotd((VB-Vr2*cosd(siy1))/Vr2*sind(siy1));
Vs2=Vr2*sind(siy1)/sind(del1);
W=(mdot/(gc*2))*(Vs1^2-Vs2^2-Vr1^2+Vr2^2);
nBlade=W/((mdot*Vs1^2)/(gc*2));