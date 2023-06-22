function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = ar1edeir.static_resid_tt(T, y, x, params);
end
residual = zeros(15, 1);
lhs = y(13);
rhs = y(13)*params(11)*(1+y(6));
residual(1) = lhs - rhs;
lhs = y(14);
rhs = y(13);
residual(2) = lhs - rhs;
lhs = y(15);
rhs = y(13)*(1-params(4))*y(1)/y(4);
residual(3) = lhs - rhs;
lhs = y(13);
rhs = y(13)*params(11)*(1-params(2)+params(4)*y(1)/y(5));
residual(4) = lhs - rhs;
lhs = y(14);
rhs = T(2);
residual(5) = lhs - rhs;
lhs = y(15);
rhs = T(2)*T(3);
residual(6) = lhs - rhs;
lhs = (1+y(6))*y(7)+y(2)+y(3);
rhs = y(1)+y(7);
residual(7) = lhs - rhs;
lhs = y(1);
rhs = T(4)*T(6);
residual(8) = lhs - rhs;
lhs = y(5);
rhs = y(3)+y(5)*(1-params(2));
residual(9) = lhs - rhs;
lhs = y(6);
rhs = params(3)+params(7)*(exp(y(7)-params(6))-1);
residual(10) = lhs - rhs;
lhs = log(y(10));
rhs = y(1)-y(2)-y(3);
residual(11) = lhs - rhs;
lhs = log(y(9));
rhs = log(y(10))/y(1);
residual(12) = lhs - rhs;
residual(13) = log(y(11));
lhs = log(y(12));
rhs = log(y(11))/y(1);
residual(14) = lhs - rhs;
lhs = log(y(8));
rhs = log(y(8))*params(9)+params(10)*x(1);
residual(15) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
