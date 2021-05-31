clc
clear all
x=input('percent of extra air /100 = ');
C=input('C= ');
H=input('H2= ');
S=input('S= ');
O=input('O2= ');
N=input('N2= ');
H2O=input('H2O= ');

HHV=(14600*C+62000*(H-O/8)+4050*S)/100;
fprintf('%f  Btu/lbm   \n',HHV)
HHV2=(33959.6*C+144212*(H-O/8)+9420.3*S)/100;
fprintf('%f  KJ/KG   \n',HHV2)


fprintf('%f  C   \n',C/12.011)
fprintf('%f  H2   \n',H/2.016)
fprintf('%f  S   \n',S/32.06)
fprintf('%f  O2   \n',O/32)
fprintf('%f  N2   \n',N/28.016)
fprintf('%f  H20   \n',H2O/18.016)
totalfuelmol=C/12.011+H/2.016+S/32.06+O/32+N/28.016+H2O/18.016;
totalgrampermolfuel=100/totalfuelmol;
disp('for products')
fprintf('%f  CO2   \n',C/12.011)
fprintf('%f  H2O   \n',H2O/18.016+H/2.016)
fprintf('%f  S2O   \n',S/32.06)
O2need=C/12.011+(H/2.016)/2+S/32.06-O/32;
N2product=O2need*(1+x)*3.76+N/28.016;
fprintf('%f  O2 we need   \n',O2need*(1+x))
fprintf('%f  N2   \n',N2product)
fprintf('%f  O2   \n',O2need*x)
totalp=N2product+S/32.06+H2O/18.016+H/2.016+C/12.011+O2need*x;
vaporpercent=(H/2.016)/totalp; % for hfg
Wo=(2.67*C+8*H+S-O); %O2 weight / Fuel weight or O2need*32
Wa=Wo/0.232; % Air weight / Fuel weight or (O2need*(32+3.76*28.016))
Ta=input('temp of air in R (80+460) (F+460=R) = ');
Pa=input('pressure of air in psi (14.7)= ');
Tg=input('temp of gas in R (80+460) (F+460=R) = ');
Pg=input('pressure of gas in psi (14.7)= ');
G=input('vapor/air (/100) =');
Wav=(1+x)*Wa*G;
VA=((1+x)*Wa*53.3*Ta)/(144*Pa); % ft^3/ lbm of fuel
y=input('percent of carbon that burn to co2/100 =');
addedH20=input('added H2O to fuel percent of mass =');
Wv=H2O+addedH20;
co2=(44/12)*y*C;
co=(28/12)*(1-y)*C;
o2=0.232*x*Wa+(16/12)*(1-y)*C;
n2=0.767*(1+x)*Wa+N;
h2o=(H/2)*18+Wv+Wav;
so2=(S/32)*64;
MT=co2/44+co/28+o2/32+so2/64+h2o/18+n2/28;
VG=MT*359*(Tg/492)*(14.7/Pg); %ft^3/ lbm of fuel