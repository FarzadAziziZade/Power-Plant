clc
clear all
format short
vf=0.0286;
vg=0.1306;
H=60; %ft
gc=32.2;
g=32.2;
pf=1/vf;
pg=1/vg;
vfg=vg-vf;
P=2500;  %psi
mdotV=152.7*60; %lbn/min
ddc=5; % inch
dri=2.5 ;% inch
Ndc=5;
Nri=50;


TdfV=0.8-0.000133*(P-250);
xtop=(vf*TdfV)/(vg-vfg*TdfV);
ptop=TdfV/(vg*xtop);
bb=pf/ptop;
prr=((log(bb))/(bb-1))*pf;
delPd=(pf-prr)*H*g/gc;
mdotW=mdotV/xtop;
cc=(0.02*0.01214)*mdotW^2;


fprintf('%f delat P drive lbf/ft^3 \n',delPd)
fprintf('%f delat P drive psi \n',delPd/144)
