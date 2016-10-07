% Ideal gas law PV=nRT
% Van der Waals equation (P+(n^2*a/V^2))(V-nb)=nRT
P=linspace(0,400,5);
n=2;
V=1;
a=5.536;
b=0.03049;
R=0.08314472;

% Ideal gas law
x=V/(n*R);
T=x*P;
T_id=T';
fprintf('%8.2f\n',T_id)

% VdW gas law
y=(n^2*a/V^2);
z=V-n*b;
T_vdw=P+y;
T_vdw2=T_vdw*z;
T_vdw3=T_vdw2/(n*R);
T_vdw3=T_vdw3';
fprintf('%8.2f\n',T_vdw3)

% P
Pf=P';

% print in command window
fprintf('        P            Ideal          VdW\n')
fprintf('===========================================\n')
fprintf('%12.2f  %12.2f  %12.2f\n',[Pf,T_id,T_vdw3]')

