clc
clear all
V1=input('V1=');
VB=input('VB= ');
tet1=input('tet1=');
kv=input('kv=');
V2=sqrt(V1^2+VB^2-2*VB*V1*cosd(tet1));
tet2=asind((V1*sind(tet1))/(V2));
V3=kv*V2;