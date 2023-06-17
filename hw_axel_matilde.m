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
[trend_y_pc_nic, cycle_nic_1]   = hpfilter(log(GDP_pc_nic),100);
[trend_c_nic, cycle_nic_2]       = hpfilter(log(C_nic),100);
[trend_i_nic, cycle_nic_3]   = hpfilter(log(I_nic),100);
[trend_g_nic, cycle_nic_4]       = hpfilter(log(G_nic),100);
[trend_tb_nic, cycle_nic_5]       = hpfilter((X_nic-M_nic)./trend_y_pc_nic,100);
[trend_gy_nic, cycle_nic_6]       = hpfilter(log(G_nic)./log(GDP_pc_nic),100);

%lambda=6.25
[trend_y_pc_nic, cycle_nic_7]   = hpfilter(log(GDP_pc_nic),6.25);
[trend_c_nic, cycle_nic_8]       = hpfilter(log(C_nic),6.25);
[trend_i_nic, cycle_nic_9]   = hpfilter(log(I_nic),6.25);
[trend_g_nic, cycle_nic_10]       = hpfilter(log(G_nic),6.25);
[trend_tb_nic, cycle_nic_11]       = hpfilter((X_nic-M_nic)./trend_y_pc_nic,6.25);
[trend_gy_nic, cycle_nic_12]       = hpfilter(log(G_nic)./log(GDP_pc_nic),6.25);


%USA
%lambda=100
[trend_y_pc_usa, cycle_usa_1]   = hpfilter(log(GDP_pc_usa),100);
[trend_c_usa, cycle_usa_2]       = hpfilter(log(C_usa),100);
[trend_i_usa, cycle_usa_3]   = hpfilter(log(I_usa),100);
[trend_g_usa, cycle_usa_4]       = hpfilter(log(G_usa),100);
[trend_tb_usa, cycle_usa_5]       = hpfilter((X_usa-M_usa)./trend_y_pc_usa,100);
[trend_gy_usa, cycle_usa_6]       = hpfilter(log(G_usa)./log(GDP_pc_usa),100);

%lambda=6.25
[trend_y_pc_usa, cycle_usa_7]   = hpfilter(log(GDP_pc_usa),6.25);
[trend_c_usa, cycle_usa_8]       = hpfilter(log(C_usa),6.25);
[trend_i_usa, cycle_usa_9]   = hpfilter(log(I_usa),6.25);
[trend_g_usa, cycle_usa_10]       = hpfilter(log(G_usa),6.25);
[trend_tb_usa, cycle_usa_11]       = hpfilter((X_usa-M_usa)./trend_y_pc_usa, 6.25);
[trend_gy_usa, cycle_usa_12]       = hpfilter(log(G_usa)./log(GDP_pc_usa),6.25);

%%%%%%%%%%%%%%%%%%%%%%
% 1.log linear detrending
%

%%%%%%%%%%%%%%%%%%%%%%
% 2.log quadratic detrending
%

%%%%%%%%%%%%%%%%%%%%%%
% 3. HP
% stD

%nic
%LAMBDA=100
for i=1:6
fprintf('%5.2f \n ',  std(cycle_nic_i)*100)
end

%LAMBDA=6.25

