%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                   %
%       International Macroeconomics BCN-PUC        %
%       Homework                                    %
%       Team: Axel Canales & Matilde Cerda          %
%                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc

%directory

%read excel 
[data_nic, input.xlstext] = xlsread('DataNicaragua.xlsx','Data');
[data_usa, input.xlstext] = xlsread('data_usa.xlsx','Data');

%transpose
nic = data_nic.';
usa = data_usa.';

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
GDP_pc_usa = usa(6:57,6);   % PIB
C_usa_gdp = usa(6:57,1);   % Consumo
I_usa_gdp = usa(6:57,2);  %Inversion
G_usa_gdp = usa(6:57,3);  %Gobierno
M_usa_gdp = usa(6:57,4);   %Imp
X_usa_gdp = usa(6:57,5); %Exp
GDP_usa_constant = usa(6:57,8); %PIB precios constantes

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
[hp6_trend_y_pc_nic, hp_cycle_nic_7]   = hpfilter(log(GDP_pc_nic),6.25);
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
det1_C_nic = detrend(log(C_nic(35:62)),1);
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
det2_C_nic = detrend(log(C_nic(35:62)),2);
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
hp100nic_ciclo = [hp_cycle_nic_1 hp_cycle_nic_3 hp_cycle_nic_4 hp_cycle_nic_5 hp_cycle_nic_6];
hp100nic_y_c = [hp_cycle_nic_1(35:62) hp_cycle_nic_2];
hp100nic_corr_ciclo= corrcoef(hp100nic_ciclo);
hp100nic_corr_y_c= corrcoef(hp100nic_y_c);%consultar si debido al consumo debemos recortar la muestra
nic_ciclo = [hp_cycle_nic_1 hp_cycle_nic_3 hp_cycle_nic_4 hp_cycle_nic_5 hp_cycle_nic_6];
nic_y_c = [hp_cycle_nic_1(35:62) hp_cycle_nic_2];
nic_corr_ciclo= corrcoef(nic_ciclo);


%HP lambda = 6.25
hp6nic_ciclo = [hp_cycle_nic_7 hp_cycle_nic_9 hp_cycle_nic_10 hp_cycle_nic_11 hp_cycle_nic_12];
hp6nic_y_c = [hp_cycle_nic_7(35:62) hp_cycle_nic_8];
hp6nic_corr_ciclo= corrcoef(hp6nic_ciclo);
hp6nic_corr_y_c= corrcoef(hp6nic_y_c);%consultar si debido al consumo debemos recortar la muestra

%log-linear detrending 
det1_nic_ciclo = [det1_gdp_pc_nic det1_I_nic det1_G_nic  det1_tb_nic det1_gy_nic];
det1_nic_y_c = [det1_gdp_pc_nic(35:62) det1_C_nic];
det1_nic_corr_ciclo= corrcoef(det1_nic_ciclo);
det1_nic_corr_y_c= corrcoef(det1_nic_y_c);%consultar si debido al consumo debemos recortar la muestra

%log-quadratic detrending
det2_nic_ciclo = [det2_gdp_pc_nic det2_I_nic det2_G_nic det2_G_nic det2_tb_nic det2_gy_nic];
det2_nic_y_c = [det2_gdp_pc_nic(35:62) det2_C_nic];
det2_nic_corr_ciclo= corrcoef(det2_nic_ciclo);
det2_nic_corr_y_c= corrcoef(det2_nic_y_c);%consultar si debido al consumo debemos recortar la muestra

%USA

%HP lambda = 100
hp100usa_ciclo = [hp_cycle_usa_1 hp_cycle_usa_3 hp_cycle_usa_4 hp_cycle_usa_5 hp_cycle_usa_6];
hp100usa_y_c = [hp_cycle_usa_1 hp_cycle_usa_2];
hp100usa_corr_ciclo= corrcoef(hp100usa_ciclo);
hp100usa_corr_y_c= corrcoef(hp100usa_y_c);%consultar si debido al consumo debemos recortar la muestra

%HP lambda = 6.25
hp6usa_ciclo = [hp_cycle_usa_7 hp_cycle_usa_9 hp_cycle_usa_10 hp_cycle_usa_11 hp_cycle_usa_12];
hp6usa_y_c = [hp_cycle_usa_7 hp_cycle_usa_8];
hp6usa_corr_ciclo= corrcoef(hp6usa_ciclo);
hp6usa_corr_y_c= corrcoef(hp6usa_y_c);%consultar si debido al consumo debemos recortar la muestra

%log-linear detrending 
det1_usa_ciclo = [det1_gdp_pc_usa det1_I_usa det1_G_usa det1_tb_usa det1_gy_usa];
det1_usa_y_c = [det1_gdp_pc_usa det1_C_usa];
det1_usa_corr_ciclo= corrcoef(det1_usa_ciclo);
det1_usa_corr_y_c= corrcoef(det1_usa_y_c);%consultar si debido al consumo debemos recortar la muestra

%LAMBDA=6.25

%log-quadratic detrending
det2_usa_ciclo = [det2_gdp_pc_usa det2_I_usa det2_G_usa det2_tb_usa det2_gy_usa];
det2_usa_y_c = [det2_gdp_pc_usa det2_C_usa];
det2_usa_corr_ciclo= corrcoef(det2_usa_ciclo);
det2_usa_corr_y_c= corrcoef(det2_usa_y_c);%consultar si debido al consumo debemos recortar la muestra

%%% Data Collection of correlation cycles by country and detrending methods
%Metodo detrending lineal - Nicaragua
results_correl(1,1)= det1_nic_corr_ciclo(1,1); %respecto a ella misma y_pc
results_correl(2,1)= det1_nic_corr_y_c(2,1); %respecto a c
results_correl(3,1)= det1_nic_corr_ciclo(2,1);%respecto a i
results_correl(4,1)= det1_nic_corr_ciclo(3,1);%respecto a g
results_correl(5,1)= det1_nic_corr_ciclo(4,1);%respecto a tb
results_correl(6,1)= det1_nic_corr_ciclo(5,1);%respecto a g/y

%Metodo detrending lineal - USA
results_correl(1,2)= det1_usa_corr_ciclo(1,1);% respecto a ella misma y_pc
results_correl(2,2)= det1_usa_corr_y_c(2,1); %respecto a c
results_correl(3,2)= det1_usa_corr_ciclo(2,1);%respecto a i
results_correl(4,2)= det1_usa_corr_ciclo(3,1);%respecto a g
results_correl(5,2)= det1_usa_corr_ciclo(4,1);%respecto a tb
results_correl(6,2)= det1_usa_corr_ciclo(5,1);%respecto a g/y

%Metodo detrending cuadratico - Nicaragua
results_correl(1,3)= det2_nic_corr_ciclo(1,1); %respecto a ella misma y_pc
results_correl(2,3)= det2_nic_corr_y_c(2,1); %respecto a c
results_correl(3,3)= det2_nic_corr_ciclo(2,1);%respecto a i
results_correl(4,3)= det2_nic_corr_ciclo(3,1);%respecto a g
results_correl(5,3)= det2_nic_corr_ciclo(4,1);%respecto a tb
results_correl(6,3)= det2_nic_corr_ciclo(5,1);%respecto a g/y

%Metodo detrending cuadratico - USA
results_correl(1,4)= det2_usa_corr_ciclo(1,1); %respecto a ella misma y_pc
results_correl(2,4)= det2_usa_corr_y_c(2,1); %respecto a c
results_correl(3,4)= det2_usa_corr_ciclo(2,1);%respecto a i
results_correl(4,4)= det2_usa_corr_ciclo(3,1);%respecto a g
results_correl(5,4)= det2_usa_corr_ciclo(4,1);%respecto a tb
results_correl(6,4)= det2_usa_corr_ciclo(5,1);%respecto a g/y

%Metodo HP lambda=100 - Nicaragua 
results_correl(1,5)= hp100nic_corr_ciclo(1,1); %respecto a ella misma y_pc
results_correl(2,5)= hp100nic_corr_y_c(2,1); %respecto a c
results_correl(3,5)= hp100nic_corr_ciclo(2,1);%respecto a i
results_correl(4,5)= hp100nic_corr_ciclo(3,1);%respecto a g
results_correl(5,5)= hp100nic_corr_ciclo(4,1);%respecto a tb
results_correl(6,5)= hp100nic_corr_ciclo(5,1);%respecto a g/y

%Metodo HP lambda=100 - United States 
results_correl(1,6)= hp100usa_corr_ciclo(1,1); %respecto a ella misma y_pc
results_correl(2,6)= hp100usa_corr_y_c(2,1); %respecto a c
results_correl(3,6)= hp100usa_corr_ciclo(2,1);%respecto a i
results_correl(4,6)= hp100usa_corr_ciclo(3,1);%respecto a g
results_correl(5,6)= hp100usa_corr_ciclo(4,1);%respecto a tb
results_correl(6,6)= hp100usa_corr_ciclo(5,1);%respecto a g/y

%Metodo HP lambda=6 - Nicaragua 
results_correl(1,7)= hp6nic_corr_ciclo(1,1); %respecto a ella misma y_pc
results_correl(2,7)= hp6nic_corr_y_c(2,1); %respecto a c
results_correl(3,7)= hp6nic_corr_ciclo(2,1);%respecto a i
results_correl(4,7)= hp6nic_corr_ciclo(3,1);%respecto a g
results_correl(5,7)= hp6nic_corr_ciclo(4,1);%respecto a tb
results_correl(6,7)= hp6nic_corr_ciclo(5,1);%respecto a g/y

%Metodo HP lambda=6 - United States 
results_correl(1,8)= hp6usa_corr_ciclo(1,1); %respecto a ella misma y_pc
results_correl(2,8)= hp6usa_corr_y_c(2,1); %respecto a c
results_correl(3,8)= hp6usa_corr_ciclo(2,1);%respecto a i
results_correl(4,8)= hp6usa_corr_ciclo(3,1);%respecto a g
results_correl(5,8)= hp6usa_corr_ciclo(4,1);%respecto a tb
results_correl(6,8)= hp6usa_corr_ciclo(5,1);%respecto a g/y

xlswrite('Resultados_correlation.xls', results_correl);

%%%%%%%%%%%%%%%%%
%4. Standard deviations
%HP
% LAMBDA=100
% Nicaragua

%for i = 1:6
%fprintf('%5.2f \n ', eval(sprintf('std(hp_cycle_nic_%i)*100',i) ))
%end

hp = {hp_cycle_nic_1, hp_cycle_nic_2, hp_cycle_nic_3, hp_cycle_nic_4,hp_cycle_nic_5,hp_cycle_nic_6};
hp_cycle_nic_std = cellfun(@std,hp);
hp_nic_std = hp_cycle_nic_std'.*100;
ratio_x_y = hp_nic_std./std(hp_cycle_nic_1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5.autocorrelation/persistence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Metodo detrending lineal - Nicaragua
[acf_det1_gdp_pc_nic,~] = autocorr(det1_gdp_pc_nic,1);
[acf_det1_C_nic,~] = autocorr(det1_C_nic,1);
[acf_det1_I_nic,~] = autocorr(det1_I_nic,1);
[acf_det1_G_nic,~] = autocorr(det1_G_nic,1);
[acf_det1_tb_nic,~] = autocorr(det1_tb_nic,1);
[acf_det1_gy_nic,~] = autocorr(det1_gy_nic,1);

%Metodo detrending lineal - USA
[acf_det1_gdp_pc_usa,~] = autocorr(det1_gdp_pc_usa,1);
[acf_det1_C_usa,~] = autocorr(det1_C_usa,1);
[acf_det1_I_usa,~] = autocorr(det1_I_usa,1);
[acf_det1_G_usa,~] = autocorr(det1_G_usa,1);
[acf_det1_tb_usa,~] = autocorr(det1_tb_usa,1);
[acf_det1_gy_usa,~] = autocorr(det1_gy_usa,1);

%Metodo detrending cuadratico - Nicaragua
[acf_det2_gdp_pc_nic,~] = autocorr(det2_gdp_pc_nic,1);
[acf_det2_C_nic,~] = autocorr(det2_C_nic,1);
[acf_det2_I_nic,~] = autocorr(det2_I_nic,1);
[acf_det2_G_nic,~] = autocorr(det2_G_nic,1);
[acf_det2_tb_nic,~] = autocorr(det2_tb_nic,1);
[acf_det2_gy_nic,~] = autocorr(det2_gy_nic,1);

%Metodo detrending cuadratico - USA
[acf_det2_gdp_pc_usa,~] = autocorr(det2_gdp_pc_usa,1);
[acf_det2_C_usa,~] = autocorr(det2_C_usa,1);
[acf_det2_I_usa,~] = autocorr(det2_I_usa,1);
[acf_det2_G_usa,~] = autocorr(det2_G_usa,1);
[acf_det2_tb_usa,~] = autocorr(det2_tb_usa,1);
[acf_det2_gy_usa,~] = autocorr(det2_gy_usa,1);

%Metodo HP lambda=100 - Nicaragua 
[acf_hp100_cycle_nic_1,~] = autocorr(hp_cycle_nic_1,1);
[acf_hp100_cycle_nic_2,~] = autocorr(hp_cycle_nic_2,1);
[acf_hp100_cycle_nic_3,~] = autocorr(hp_cycle_nic_3,1);
[acf_hp100_cycle_nic_4,~] = autocorr(hp_cycle_nic_4,1);
[acf_hp100_cycle_nic_5,~] = autocorr(hp_cycle_nic_5,1);
[acf_hp100_cycle_nic_6,~] = autocorr(hp_cycle_nic_6,1);

%Metodo HP lambda=100 - United States 
[acf_hp100_cycle_usa_1,~] = autocorr(hp_cycle_usa_1,1);
[acf_hp100_cycle_usa_2,~] = autocorr(hp_cycle_usa_2,1);
[acf_hp100_cycle_usa_3,~] = autocorr(hp_cycle_usa_3,1);
[acf_hp100_cycle_usa_4,~] = autocorr(hp_cycle_usa_4,1);
[acf_hp100_cycle_usa_5,~] = autocorr(hp_cycle_usa_5,1);
[acf_hp100_cycle_usa_6,~] = autocorr(hp_cycle_usa_6,1);

%Metodo HP lambda=6 - Nicaragua 
[acf_hp6_cycle_nic_7,~] = autocorr(hp_cycle_nic_7,1);
[acf_hp6_cycle_nic_8,~] = autocorr(hp_cycle_nic_8,1);
[acf_hp6_cycle_nic_9,~] = autocorr(hp_cycle_nic_9,1);
[acf_hp6_cycle_nic_10,~] = autocorr(hp_cycle_nic_10,1);
[acf_hp6_cycle_nic_11,~] = autocorr(hp_cycle_nic_11,1);
[acf_hp6_cycle_nic_12,~] = autocorr(hp_cycle_nic_12,1);

%Metodo HP lambda=6 - United States 
[acf_hp6_cycle_usa_7,~] = autocorr(hp_cycle_usa_7,1);
[acf_hp6_cycle_usa_8,~] = autocorr(hp_cycle_usa_8,1);
[acf_hp6_cycle_usa_9,~] = autocorr(hp_cycle_usa_9,1);
[acf_hp6_cycle_usa_10,~] = autocorr(hp_cycle_usa_10,1);
[acf_hp6_cycle_usa_11,~] = autocorr(hp_cycle_usa_11,1);
[acf_hp6_cycle_usa_12,~] = autocorr(hp_cycle_usa_12,1);

%%%%%%%%%% Data collection of autocorrelation by country and detrending method
%Linear detrending method - Nicaragua 
results_auto(1,1)= acf_det1_gdp_pc_nic(2,1);
results_auto(2,1)=acf_det1_C_nic(2,1);
results_auto(3,1)=acf_det1_I_nic(2,1);
results_auto(4,1)=acf_det1_G_nic(2,1);
results_auto(5,1)=acf_det1_tb_nic(2,1);
results_auto(6,1)=acf_det1_gy_nic(2,1); 
%Linear detrending method - United States 
results_auto(1,2)= acf_det1_gdp_pc_usa(2,1);
results_auto(2,2)=acf_det1_C_usa(2,1);
results_auto(3,2)=acf_det1_I_usa(2,1);
results_auto(4,2)=acf_det1_G_usa(2,1);
results_auto(5,2)=acf_det1_tb_usa(2,1);
results_auto(6,2)=acf_det1_gy_usa(2,1); 
%Quadratic detrending method - Nicaragua 
results_auto(1,3)= acf_det2_gdp_pc_nic(2,1);
results_auto(2,3)=acf_det2_C_nic(2,1);
results_auto(3,3)=acf_det2_I_nic(2,1);
results_auto(4,3)=acf_det2_G_nic(2,1);
results_auto(5,3)=acf_det2_tb_nic(2,1);
results_auto(6,3)=acf_det2_gy_nic(2,1); 
%Quadratic detrending method - United States 
results_auto(1,4)= acf_det2_gdp_pc_usa(2,1);
results_auto(2,4)=acf_det2_C_usa(2,1);
results_auto(3,4)=acf_det2_I_usa(2,1);
results_auto(4,4)=acf_det2_G_usa(2,1);
results_auto(5,4)=acf_det2_tb_usa(2,1);
results_auto(6,4)=acf_det2_gy_usa(2,1); 
%Metodo HP lambda=100 - Nicaragua 
results_auto(1,5)=acf_hp100_cycle_nic_1(2,1);
results_auto(2,5)=acf_hp100_cycle_nic_2(2,1);
results_auto(3,5)=acf_hp100_cycle_nic_3(2,1);
results_auto(4,5)=acf_hp100_cycle_nic_4(2,1);
results_auto(5,5)=acf_hp100_cycle_nic_5(2,1);
results_auto(6,5)=acf_hp100_cycle_nic_6(2,1);
%Metodo HP lambda=100 - United States 
results_auto(1,6)=acf_hp100_cycle_usa_1(2,1);
results_auto(2,6)=acf_hp100_cycle_usa_2(2,1);
results_auto(3,6)=acf_hp100_cycle_usa_3(2,1);
results_auto(4,6)=acf_hp100_cycle_usa_4(2,1);
results_auto(5,6)=acf_hp100_cycle_usa_5(2,1);
results_auto(6,6)=acf_hp100_cycle_usa_6(2,1);
%Metodo HP lambda=6.25 - Nicaragua 
results_auto(1,7)=acf_hp6_cycle_nic_7(2,1);
results_auto(2,7)=acf_hp6_cycle_nic_8(2,1);
results_auto(3,7)=acf_hp6_cycle_nic_9(2,1);
results_auto(4,7)=acf_hp6_cycle_nic_10(2,1);
results_auto(5,7)=acf_hp6_cycle_nic_11(2,1);
results_auto(6,7)=acf_hp6_cycle_nic_12(2,1);
%Metodo HP lambda=6.25 - United States 
results_auto(1,8)=acf_hp6_cycle_usa_7(2,1);
results_auto(2,8)=acf_hp6_cycle_usa_8(2,1);
results_auto(3,8)=acf_hp6_cycle_usa_9(2,1);
results_auto(4,8)=acf_hp6_cycle_usa_10(2,1);
results_auto(5,8)=acf_hp6_cycle_usa_11(2,1);
results_auto(6,8)=acf_hp6_cycle_usa_12(2,1);
%Export to excel autocorrelation table 
xlswrite('Resultados_autocorrelation.xls', results_auto);

%%%%%%% 1.B %%%%%%%%%%%
%%%%% Graph showing the natural logarithm of real per capita GDP and the trend, one panel per trend.
%%%%%% how the detrending method influences the volatility of the cyclical component of output.? 
%%%%%% Nicaragua
figure(1)
subplot(2,2,1);
x = 1960:2021;
plot(x,log(GDP_pc_nic),x,trend_y_pc_nic,'-');
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
legend('PIB per capita a precios contante ','Tendencia');
title('HP filtering with λ = 100','FontSize', 12);

subplot(2,2,2);
plot(x,log(GDP_pc_nic),x,hp6_trend_y_pc_nic);
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
title('HP filtering with λ = 6.25');

subplot(2,2,3);
trend1_gdp_pc_nic = log(GDP_pc_nic) - det1_gdp_pc_nic;
plot(x,log(GDP_pc_nic),x,trend1_gdp_pc_nic);
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
title('Log-linear detrending')

subplot(2,2,4);
trend2_gdp_pc_nic = log(GDP_pc_nic) - det2_gdp_pc_nic;
plot(x,log(GDP_pc_nic),x,trend2_gdp_pc_nic);
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
title('Log-quadratic detrending;')

%%%%%% USA
%Following variables are created for the entire sample
GDP_pc_usa1 = usa(:,6);
[graph_trend_y_pc_usa,~]   = hpfilter(log(GDP_pc_usa1),100);
[graph6_trend_y_pc_usa,~]   = hpfilter(log(GDP_pc_usa1),6.25);
det1_gdp_pc_usa_g = detrend(log(GDP_pc_usa1),1);
det2_gdp_pc_usa_g = detrend(log(GDP_pc_usa1),2);

figure(2)
subplot(2,2,1);
x = 1965:2021;
plot(x,log(GDP_pc_usa1),x,graph_trend_y_pc_usa,'-');
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
legend('PIB per capita a precios contante ','Tendencia');
title('HP filtering with λ = 100','FontSize', 12);

subplot(2,2,2);
plot(x,log(GDP_pc_usa1),x,graph6_trend_y_pc_usa);
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
title('HP filtering with λ = 6.25');

subplot(2,2,3);
GDP_pc_usa1 = usa(:,6); 
trend1_gdp_pc_usa = log(GDP_pc_usa1) - det1_gdp_pc_usa_g;
plot(x,log(GDP_pc_usa1),x,trend1_gdp_pc_usa);
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
title('Log-linear detrending')

subplot(2,2,4);
trend2_gdp_pc_usa = log(GDP_pc_usa1) - det2_gdp_pc_usa_g;
plot(x,log(GDP_pc_usa1),x,trend2_gdp_pc_usa);
xlabel('Periodo de Estudio');
ylabel('Logaritmo');
title('Log-quadratic detrending;')
