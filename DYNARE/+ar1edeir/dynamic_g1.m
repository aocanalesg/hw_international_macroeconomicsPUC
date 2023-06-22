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
    T = ar1edeir.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(15, 23);
g1(1,10)=(-(params(11)*y(22)));
g1(1,17)=1;
g1(1,22)=(-(params(11)*(1+y(10))));
g1(2,17)=(-1);
g1(2,18)=1;
g1(3,5)=(-(y(17)*(1-params(4))/y(8)));
g1(3,8)=(-((-(y(17)*(1-params(4))*y(5)))/(y(8)*y(8))));
g1(3,17)=(-((1-params(4))*y(5)/y(8)));
g1(3,19)=1;
g1(4,20)=(-(params(11)*y(22)*params(4)/y(9)));
g1(4,1)=y(17)*(-params(8));
g1(4,9)=y(17)*params(8)-params(11)*y(22)*((-(params(4)*y(20)))/(y(9)*y(9))-params(8));
g1(4,21)=(-(params(8)*params(11)*y(22)));
g1(4,17)=1+params(8)*(y(9)-y(1));
g1(4,22)=(-(params(11)*(params(8)*(y(21)-y(9))+1-params(2)+params(4)*y(20)/y(9))));
g1(5,6)=(-T(8));
g1(5,8)=(-T(9));
g1(5,18)=1;
g1(6,6)=(-(T(3)*T(8)));
g1(6,8)=(-(T(3)*T(9)+T(2)*getPowerDeriv(y(8),params(5)-1,1)));
g1(6,19)=1;
g1(7,5)=(-1);
g1(7,6)=1;
g1(7,7)=1;
g1(7,1)=params(8)/2*(-(2*(y(9)-y(1))));
g1(7,9)=params(8)/2*2*(y(9)-y(1));
g1(7,2)=y(3);
g1(7,3)=1+y(2);
g1(7,11)=(-1);
g1(8,5)=1;
g1(8,8)=(-(T(7)*getPowerDeriv(y(8),1-params(4),1)));
g1(8,1)=(-(T(4)*y(12)*getPowerDeriv(y(1),params(4),1)));
g1(8,12)=(-(T(4)*T(6)));
g1(9,7)=(-1);
g1(9,1)=(-(1-params(2)));
g1(9,9)=1;
g1(10,10)=1;
g1(10,11)=(-(params(7)*exp(y(11)-params(6))));
g1(11,5)=(-1);
g1(11,6)=1;
g1(11,7)=1;
g1(11,1)=params(8)/2*(-(2*(y(9)-y(1))));
g1(11,9)=params(8)/2*2*(y(9)-y(1));
g1(11,14)=1/y(14);
g1(12,5)=(-((-log(y(14)))/(y(5)*y(5))));
g1(12,13)=1/y(13);
g1(12,14)=(-(1/y(14)/y(5)));
g1(13,3)=(-1);
g1(13,11)=1;
g1(13,15)=1/y(15);
g1(14,5)=(-((-log(y(15)))/(y(5)*y(5))));
g1(14,15)=(-(1/y(15)/y(5)));
g1(14,16)=1/y(16);
g1(15,4)=(-(params(9)*1/y(4)));
g1(15,12)=1/y(12);
g1(15,23)=(-params(10));

end
