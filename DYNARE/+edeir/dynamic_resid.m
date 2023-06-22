function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = edeir.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(16, 1);
lhs = y(18);
rhs = params(12)*(1+y(11))*y(24);
residual(1) = lhs - rhs;
lhs = y(19);
rhs = y(18);
residual(2) = lhs - rhs;
lhs = y(20);
rhs = y(18)*(1-params(4))*y(6)/y(9);
residual(3) = lhs - rhs;
lhs = y(18)*(1+params(8)*(y(10)-y(1)));
rhs = params(12)*y(24)*(params(8)*(y(23)-y(10))+1-params(2)+params(4)*y(22)/y(10));
residual(4) = lhs - rhs;
lhs = y(19);
rhs = T(2);
residual(5) = lhs - rhs;
lhs = y(20);
rhs = T(2)*T(3);
residual(6) = lhs - rhs;
lhs = (1+y(2))*y(3)+y(7)+y(8)+T(5);
rhs = y(6)+y(12);
residual(7) = lhs - rhs;
lhs = y(6);
rhs = T(4)*T(7);
residual(8) = lhs - rhs;
lhs = y(10);
rhs = y(8)+(1-params(2))*y(1);
residual(9) = lhs - rhs;
lhs = y(11);
rhs = params(3)+params(7)*(exp(y(12)-params(6))-1);
residual(10) = lhs - rhs;
lhs = log(y(15));
rhs = y(6)-y(7)-y(8)-T(5);
residual(11) = lhs - rhs;
lhs = log(y(14));
rhs = log(y(15))/y(6);
residual(12) = lhs - rhs;
lhs = log(y(16));
rhs = (-(y(12)-y(3)));
residual(13) = lhs - rhs;
lhs = log(y(17));
rhs = log(y(16))/y(6);
residual(14) = lhs - rhs;
lhs = log(y(13));
rhs = params(11)*x(it_, 1)+params(9)*log(y(4))+params(10)*log(y(5));
residual(15) = lhs - rhs;
lhs = y(21);
rhs = y(4);
residual(16) = lhs - rhs;

end
