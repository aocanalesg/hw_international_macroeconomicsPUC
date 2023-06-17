%%%%%%%%%%%
%
%       International Macroeconomics BCN-PUC
%       Homework
%       Team: Axel Canales & Matilde Cerda
%
%%%%%%%%%%%
clear all
close all
clc

%directory

%read excel
[data, input.xlstext] = xlsread('DataNicaragua.xls','Data');

%Series en niveles
Y = data(:,1);   % PIB
C = data(:,2);   % Consumo


%importing data
%D = readtable('P_Data_Extract_From_World_Development_Indicators_FINAL.xlsx','Range','A1:BN9')

%variables name
%name=["gdp_pc","2c_gdp", "i_gdp", "g_gdp", "m_gdp", "x_gdp", "gdp_const", "gdp_curr"]
%date=[1960:2021, ]

%transpose

%D2 = rows2vars(D)
%D2.Properties.VariableNames = ["gdp_pc","c_gdp","i_gdp","g_gdp","m_gdp","x_gdp","gdp_const","gdp_curr"]