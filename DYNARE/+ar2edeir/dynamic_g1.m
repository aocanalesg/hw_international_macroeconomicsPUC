function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = AR2edeir.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(16, 25);
g1(1,11)=(-(params(12)*y(24)));
g1(1,18)=1;
g1(1,24)=(-(params(12)*(1+y(11))));
g1(2,18)=(-1);
g1(2,19)=1;
g1(3,6)=(-(y(18)*(1-params(4))/y(9)));
g1(3,9)=(-((-(y(18)*(1-params(4))*y(6)))/(y(9)*y(9))));
g1(3,18)=(-((1-params(4))*y(6)/y(9)));
g1(3,20)=1;
g1(4,22)=(-(params(12)*y(24)*params(4)/y(10)));
g1(4,1)=y(18)*(-params(8));
g1(4,10)=y(18)*params(8)-params(12)*y(24)*((-(params(4)*y(22)))/(y(10)*y(10))-params(8));
g1(4,23)=(-(params(8)*params(12)*y(24)));
g1(4,18)=1+params(8)*(y(10)-y(1));
g1(4,24)=(-(params(12)*(params(8)*(y(23)-y(10))+1-params(2)+params(4)*y(22)/y(10))));
g1(5,7)=(-T(8));
g1(5,9)=(-T(9));
g1(5,19)=1;
g1(6,7)=(-(T(3)*T(8)));
g1(6,9)=(-(T(3)*T(9)+T(2)*getPowerDeriv(y(9),params(5)-1,1)));
g1(6,20)=1;
g1(7,6)=(-1);
g1(7,7)=1;
g1(7,8)=1;
g1(7,1)=params(8)/2*(-(2*(y(10)-y(1))));
g1(7,10)=params(8)/2*2*(y(10)-y(1));
g1(7,2)=y(3);
g1(7,3)=1+y(2);
g1(7,12)=(-1);
g1(8,6)=1;
g1(8,9)=(-(T(7)*getPowerDeriv(y(9),1-params(4),1)));
g1(8,1)=(-(T(4)*y(13)*getPowerDeriv(y(1),params(4),1)));
g1(8,13)=(-(T(4)*T(6)));
g1(9,8)=(-1);
g1(9,1)=(-(1-params(2)));
g1(9,10)=1;
g1(10,11)=1;
g1(10,12)=(-(params(7)*exp(y(12)-params(6))));
g1(11,6)=(-1);
g1(11,7)=1;
g1(11,8)=1;
g1(11,1)=params(8)/2*(-(2*(y(10)-y(1))));
g1(11,10)=params(8)/2*2*(y(10)-y(1));
g1(11,15)=1/y(15);
g1(12,6)=(-((-log(y(15)))/(y(6)*y(6))));
g1(12,14)=1/y(14);
g1(12,15)=(-(1/y(15)/y(6)));
g1(13,3)=(-1);
g1(13,12)=1;
g1(13,16)=1/y(16);
g1(14,6)=(-((-log(y(16)))/(y(6)*y(6))));
g1(14,16)=(-(1/y(16)/y(6)));
g1(14,17)=1/y(17);
g1(15,4)=(-(params(9)*1/y(4)));
g1(15,13)=1/y(13);
g1(15,25)=(-params(11));
g1(15,5)=(-(params(10)*1/y(5)));
g1(16,4)=(-1);
g1(16,21)=1;

end
