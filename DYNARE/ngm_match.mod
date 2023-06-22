% neoclassical growth model

% Endogenous variables
var y c k A;

% Exogenous variables
varexo e;

predetermined_variables k; 

% Parameters
parameters alpha beta delta sigma rho sigmae ;
    alpha   = 1/3;
    beta    = 0.98;
    delta   = 0.025;
    sigma   = 1;
    rho     = 0.5;
    sigmae  = 0.01;

model;
    c^(-sigma) = beta*c(+1)^(-sigma)*(alpha*A(+1)*k(+1)^(alpha-1)+1-delta);
    c+k(+1) = y+(1-delta)*k;
    y=A*k^alpha;
    log(A) = rho*log(A(-1)) + sigmae*e;
end;

steady_state_model;
    A = 1;
    k = ((1-beta*(1-delta))/(beta*alpha*A))^(1/(alpha-1));
    y = A*k^alpha;
    c = y-delta*k;
end;

steady;
check;

shocks;
    var e=1;
end;

%Log-linealizar el modelo
stoch_simul(order=1,loglinear,contemporaneous_correlation);

x_start=[sigmae rho]; %use calibration as starting point
%make sure Dynare does not print out stuff during runs
options_.nofunctions=1;
options_.nograph=1;
options_.verbosity=0;
%set noprint option to suppress error messages within optimizer
options_.noprint=1;     %no-print the results

% set csminwel options
H0   = 0.05*eye(length(x_start)); %Initial Hessian 
crit = 1e-8;                      %Tolerance
nit  = 1000;                      %Number of iterations

target=[0.0474; 0.81];

[fhat,x_opt_hat] = csminwel(@moment_objective,x_start,H0,[],crit,nit,target,oo_, M_,options_);

set_param_value('sigmae',x_opt_hat(1)); %we get the new sigmae which minimize the distance D
set_param_value('rho',x_opt_hat(2));    %we get the new rho which minimize the distance D

options_.noprint=0;                     %print the results
stoch_simul(order=1,loglinear,irf=20);
