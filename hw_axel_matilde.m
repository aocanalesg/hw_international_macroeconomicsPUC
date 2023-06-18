%%%%%%%%%%%
%
%       International Macroeconomics BCN-PUC
%       Homework
%       Team: Axel Canales & Matilde Cerda
%
%%%%%%%%%%%
clear all; close all; clc

%directory

%read excel 
[data_nic, input.xlstext] = xlsread('DataNicaragua.xlsx','Data');
[data_usa, input.xlstext] = xlsread('data_usa.xlsx','Data');

%transpose
nic = data_nic.'
usa = data_usa.'

%%%%%%%%% NIC data %%%%%%%%%%%
%Ratio series 
GDP_pc_nic = nic(:,1);   % GDP
C_nic_gdp = nic(:,2);   % Consumption
I_nic_gdp = nic(:,3);  %Investment
G_nic_gdp = nic(:,4);  %Government
M_nic_gdp = nic(:,5);   %Imp.
X_nic_gdp = nic(:,6); %Exp.
GDP_nic_constant = nic(:,7); %PIB precios constantes

%convert to leveles per capita
C_nic = C_nic_gdp.*GDP_pc_nic;
I_nic= I_nic_gdp.*GDP_pc_nic;
G_nic= G_nic_gdp.*GDP_pc_nic;
M_nic= M_nic_gdp.*GDP_pc_nic;
X_nic= X_nic_gdp.*GDP_pc_nic;

%%%%%%%%% USA data %%%%%%%%%%%
%Ratio series
GDP_pc_usa = usa(6:57,1);   % PIB
C_usa_gdp = usa(6:57,2);   % Consumo
I_usa_gdp = usa(6:57,3);  %Inversion
G_usa_gdp = usa(6:57,4);  %Gobierno
M_usa_gdp = usa(6:57,5);   %Imp
X_usa_gdp = usa(6:57,6); %Exp
GDP_usa_constant = usa(6:57,7); %PIB precios constantes

%convert to leveles per capita
C_usa = C_usa_gdp.*GDP_pc_usa;
I_usa= I_usa_gdp.*GDP_pc_usa;
G_usa= G_usa_gdp.*GDP_pc_usa;
M_usa= M_usa_gdp.*GDP_pc_usa;
X_usa= X_usa_gdp.*GDP_pc_usa;


%%%%%%%%%%% Cycle-trend decomposition %%%%%%%%%%%
%NIC
%lambda=100
[trend_y_pc_nic, hp_cycle_nic_1]   = hpfilter(log(GDP_pc_nic),100);
[~, hp_cycle_nic_2]       = hpfilter(log(C_nic),100);
[~, hp_cycle_nic_3]   = hpfilter(log(I_nic),100);
[~, hp_cycle_nic_4]       = hpfilter(log(G_nic),100);
[~, hp_cycle_nic_5]       = hpfilter((X_nic-M_nic)./trend_y_pc_nic,100);
[~, hp_cycle_nic_6]       = hpfilter(log(G_nic)./log(GDP_pc_nic),100);

%lambda=6.25
[trend_y_pc_nic, hp_cycle_nic_7]   = hpfilter(log(GDP_pc_nic),6.25);
[~, hp_cycle_nic_8]       = hpfilter(log(C_nic),6.25);
[~, hp_cycle_nic_9]   = hpfilter(log(I_nic),6.25);
[~, hp_cycle_nic_10]       = hpfilter(log(G_nic),6.25);
[~, hp_cycle_nic_11]       = hpfilter((X_nic-M_nic)./trend_y_pc_nic,6.25);
[~, hp_cycle_nic_12]       = hpfilter(log(G_nic)./log(GDP_pc_nic),6.25);


%USA
%lambda=100
[trend_y_pc_usa_1, hp_cycle_usa_1]   = hpfilter(log(GDP_pc_usa),100);
[~, hp_cycle_usa_2]       = hpfilter(log(C_usa),100);
[~, hp_cycle_usa_3]   = hpfilter(log(I_usa),100);
[~, hp_cycle_usa_4]       = hpfilter(log(G_usa),100);
[~, hp_cycle_usa_5]       = hpfilter((X_usa-M_usa)./trend_y_pc_usa_1,100);
[~, hp_cycle_usa_6]       = hpfilter(log(G_usa)./log(GDP_pc_usa),100);

%lambda=6.25
[trend_y_pc_usa, hp_cycle_usa_7]   = hpfilter(log(GDP_pc_usa),6.25);
[~, hp_cycle_usa_8]       = hpfilter(log(C_usa),6.25);
[~, hp_cycle_usa_9]   = hpfilter(log(I_usa),6.25);
[~, hp_cycle_usa_10]       = hpfilter(log(G_usa),6.25);
[~, hp_cycle_usa_11]       = hpfilter((X_usa-M_usa)./trend_y_pc_usa, 6.25);
[~, hp_cycle_usa_12]       = hpfilter(log(G_usa)./log(GDP_pc_usa),6.25);

%%%%%%%%%%%%%%%%%%%%%%
% 1.log linear detrending
%Nicaragua
det1_gdp_pc_nic = detrend(log(GDP_pc_nic),1);
det1_C_nic = detrend(log(C_nic),1);
det1_I_nic = detrend(log(I_nic),1);
det1_G_nic = detrend(log(G_nic),1);
det1_tb_nic = detrend((X_nic-M_nic)./det1_gdp_pc_nic,1);
det1_gy_nic = detrend(log(G_nic)./log(GDP_pc_nic),1);

%USA
det1_gdp_pc_usa = detrend(log(GDP_pc_usa),1);
det1_C_usa = detrend(log(C_usa),1);
det1_I_usa = detrend(log(I_usa),1);
det1_G_usa = detrend(log(G_usa),1);
det1_tb_usa = detrend((X_usa-M_usa)./det1_gdp_pc_usa,1);
det1_gy_usa = detrend(log(G_usa)./log(GDP_pc_usa),1);

%%%%%%%%%%%%%%%%%%%%%%
% 2.log quadratic detrending
%Nicaragua 
det2_gdp_pc_nic = detrend(log(GDP_pc_nic),2);
det2_C_nic = detrend(log(C_nic),2);
det2_I_nic = detrend(log(I_nic),2);
det2_G_nic = detrend(log(G_nic),2);
det2_tb_nic = detrend((X_nic-M_nic)./det1_gdp_pc_nic,2);
det2_gy_nic = detrend(log(G_nic)./log(GDP_pc_nic),2);

%USA
det2_gdp_pc_usa = detrend(log(GDP_pc_usa),2);
det2_C_usa = detrend(log(C_usa),2);
det2_I_usa = detrend(log(I_usa),2);
det2_G_usa = detrend(log(G_usa),2);
det2_tb_usa = detrend((X_usa-M_usa)./det2_gdp_pc_usa,2);
det2_gy_usa = detrend(log(G_usa)./log(GDP_pc_usa),2);

%%%%%%%%%%%%%%%%%%%%%%
% 3. Correlatios per country and detrending method
%Nicaragua
%HP lambda = 100
nic_ciclo = [hp_cycle_nic_1 hp_cycle_nic_3 hp_cycle_nic_4 hp_cycle_nic_5 hp_cycle_nic_6];
nic_y_c = [hp_cycle_nic_1[35:62] hp_cycle_nic_2[35:62]];
nic_corr_ciclo= corrcoef(nic_ciclo);

%HP lambda = 6.25
%log-linear detrending 
%log-quadratic detrending

%A = [x y 2*y+3];
%R = corrcoef(A)






%nic
%LAMBDA=100
%for i=1:6
%fprintf('%5.2f \n ',  std(cycle_nic_i)*100)
%end

%LAMBDA=6.25

