clc
clear all
format short
vf=0.02859;
vg=0.13068;
x=0.5;
H=40; %ft
S=1.2;
gc=32.2;
g=32.2;
pf=1/vf;
pg=1/vg;
siy=(vf/vg)*S;
alfa=1/(1+((1-x)/x)*siy);
vfg=vg-vf;
P=2500;  %psi
TdfV=0.8-0.000133*(P-250);
xtop=(vf*TdfV)/(vg-vfg*TdfV);
% alfa=
% x=1/(1+((1-alfa)/alfa)*(1/siy));
pr=pf-((pf-pg)/(1-siy))*(1-((1/(alfa*(1-siy)))-1)*log(1/(1-alfa*(1-siy))));
% OR
ptop=TdfV/(vg*xtop);
bb=pf/ptop;
prr=((log(bb))/(bb-1))*pf;
delPd=(pf-prr)*H*g/gc;
%
delPd=(pf-pr)*H*g/gc;
fprintf('%f lbf/ft^3 \n',delPd)
fprintf('%f psi \n',delPd/144)
mdotV=1; %lbn/min
ddc=5; % inch
dri=2.5; % inch
Ndc=10;
Nri=150;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mdotW=mdotV/xtop;
cc=(0.02*0.01214)*mdotW^2;
delPdc=cc/(pf*(ddc^5)*(Ndc^2));
delPri=cc/(prr*(dri^5)*(Nri^2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pa=1   *144  ;%lbf/ft^2 or x 144 psi
Ps=Pa;
Ra=53.34;
Rs=Ra;
H=1   ;%ft
Ta=1   ;%R
Tin=1   ;%R
Tout=1   ;%R
Ts=(Tin+Tout)/2;
%
D=1    ;%meter
Vs=1    ;%m/s
Vw=1     ;%m/s
m=1      ;%kg/s
cp=1005; %j/kg.k
Qe=m*cp*(Tout-Ta); %J/s
delH=-0.029*Vs*D/Vw+2.62*(Qe^0.5)/Vw;
He=H+delH;
%
g=32.2;
gc=32.2;
deltapd2=((Pa/(Ra*Ta))-(Ps/(Rs*Ts)))*H*g/gc;
