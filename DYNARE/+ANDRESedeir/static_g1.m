function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = ANDRESedeir.static_g1_tt(T, y, x, params);
end
g1 = zeros(15, 15);
g1(1,6)=(-(y(13)*params(11)));
g1(1,13)=1-params(11)*(1+y(6));
g1(2,13)=(-1);
g1(2,14)=1;
g1(3,1)=(-(y(13)*(1-params(4))/y(4)));
g1(3,4)=(-((-(y(13)*(1-params(4))*y(1)))/(y(4)*y(4))));
g1(3,13)=(-((1-params(4))*y(1)/y(4)));
g1(3,15)=1;
g1(4,1)=(-(y(13)*params(11)*params(4)/y(5)));
g1(4,5)=(-(y(13)*params(11)*(-(params(4)*y(1)))/(y(5)*y(5))));
g1(4,13)=1-params(11)*(1-params(2)+params(4)*y(1)/y(5));
g1(5,2)=(-T(7));
g1(5,4)=(-T(8));
g1(5,14)=1;
g1(6,2)=(-(T(3)*T(7)));
g1(6,4)=(-(T(3)*T(8)+T(2)*getPowerDeriv(y(4),params(5)-1,1)));
g1(6,15)=1;
g1(7,1)=(-1);
g1(7,2)=1;
g1(7,3)=1;
g1(7,6)=y(7);
g1(7,7)=y(6);
g1(8,1)=1;
g1(8,4)=(-(T(6)*getPowerDeriv(y(4),1-params(4),1)));
g1(8,5)=(-(T(4)*y(8)*getPowerDeriv(y(5),params(4),1)));
g1(8,8)=(-(T(4)*T(5)));
g1(9,3)=(-1);
g1(9,5)=1-(1-params(2));
g1(10,6)=1;
g1(10,7)=(-(params(7)*exp(y(7)-params(6))));
g1(11,1)=(-1);
g1(11,2)=1;
g1(11,3)=1;
g1(11,10)=1/y(10);
g1(12,1)=(-((-log(y(10)))/(y(1)*y(1))));
g1(12,9)=1/y(9);
g1(12,10)=(-(1/y(10)/y(1)));
g1(13,11)=1/y(11);
g1(14,1)=(-((-log(y(11)))/(y(1)*y(1))));
g1(14,11)=(-(1/y(11)/y(1)));
g1(14,12)=1/y(12);
g1(15,8)=1/y(8)-params(9)*1/y(8);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
