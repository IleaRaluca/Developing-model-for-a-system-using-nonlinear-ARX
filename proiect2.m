clc
clear
load('iddata-21.mat')
u_id=id.U;
u_val=val.U;
y_id=id.Y;
y_val=val.Y;
na=5;
nb=na;
nk=1;
m=2;
%predictie
%id
phi_predictie_id=aflarephi(na,nb,nk,m,y_id,u_id);
teta=phi_predictie_id\y_id;
y_predictie_id=phi_predictie_id*teta;
figure(1)
plot(y_id)
hold on
plot(y_predictie_id)
e1=y_predictie_id-y_id;
mse1=mean(e1.^2);
title(['Mse predictie identificare = ',num2str(mse1)]);
legend('y id','ypredictie id')
hold off

%val
phi_predictie_val=aflarephi(na,nb,nk,m,y_val,u_val);
y_predictie_val=phi_predictie_val*teta;
figure(2)
plot(y_val)
hold on
plot(y_predictie_val)
e2=y_predictie_val-y_val;
mse2=mean(e2.^2);
title(['Mse predictie validare = ',num2str(mse2)]);
legend('y val','ypredictie val')
hold off

%simulare
%id
phi_simulare_id=aflarephi(na,nb,nk,m,y_predictie_id,u_id);
y_simulare_id=phi_simulare_id*teta;
figure(3)
plot(y_predictie_id)
hold on
plot(y_simulare_id)
e3=y_simulare_id-y_predictie_id;
mse3=mean(e3.^2);
title(['Mse simulare identificare = ',num2str(mse3)]);
legend('ypredictie id','ysimulare id')
hold off

%val
phi_simulare_val=aflarephi(na,nb,nk,m,y_predictie_val,u_val);
y_simulare_val=phi_simulare_val*teta;
figure(4)
plot(y_predictie_val)
hold on
plot(y_simulare_val)
e4=y_simulare_val-y_predictie_val;
mse4=mean(e4.^2);
title(['Mse simulare validare = ',num2str(mse4)]);
legend('ypredictie val','ysimulare val')
hold off
