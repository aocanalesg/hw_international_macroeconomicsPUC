

%%%% PROBLEMA 5

var y c i h k r d A tby tb ca cay
    la Uc Uh;  

predetermined_variables k; 

varexo eps;

parameters sigma delta rstar alpha omega dbar psi phi rho0 rho1 etatilde
           beta sigma_eps;

sigma   = 2;                 %MENDOZA
delta   = 0.1;               %depreciation rate
rstar   = 0.04;              %long-run interest rate
alpha   = 0.32;              %F(k,h) = k^ALFA h^(1-ALFA)
omega   = 1.455;             %Frisch ela st. from Mendoza 1991
dbar    = 0.7442;            %debt
beta    = 1/(1+rstar);
sigma_eps = 1;

%parameters to be matched
psi     = 0.000742;          %debt elasticity of interest rate 
phi     = 0.028;             %capital adjustment cost
rho   = 1.42;              %persistence of TFP shock               
etatilde= 0.0129;            %sd of innovation to TFP shock


model;

% FOC of d (Eq. 4.7)
    la = beta*(1+r)*la(+1);

%  FOC of c (Eq. 4.8)
    Uc = la;

% FOC of h (Eq. 4.9)
    Uh = (1-alpha)*la*y/h;      % Without (-)
                                % The same in line 47

% FOC of k{t+1} (Eq. 4.10)
    la*(1+phi*(k(+1)-k)) = beta*la(+1)*(alpha*y(+1)/k(+1)+(1-delta)+ 
                           phi*(k(+2)-k(+1)));

% Marginal utility with respect to c
    Uc = (c-1/omega*h^omega)^(-sigma);

%  Marginal utility with respect to h
    Uh = h^(omega-1)*(c-1/omega*h^omega)^(-sigma);  % Without (-)

% Budget constraint
    c+i+phi/2*(k(+1)-k)^2 + (1+r(-1))*d(-1) = y+d;

% Production function
    y = A * k^(alpha) * h^(1-alpha);

% Capital
    k(+1) = (1-delta)*k + i;

% Edeir
    r = rstar + psi*(exp(d-dbar)-1);

% Trade balance
    log(tb) = y - c - i - phi/2*(k(+1)-k)^2; 

% Trade balance %GDP
    log(tby) = log(tb)/y;

% Current account
    log(ca) = -(d-d(-1));

% Current account % GDP
    log(cay) = log(ca)/y;

% Productivy
    log(A) = rho0*log(A(-1)) + rho1*log(A(-2))+ etatilde*eps;
    
end;

steady_state_model;
    A   = 1;
    r   = rstar;        
    d   = dbar;
    h   = ((1-alpha)*(alpha/(rstar+delta))^(alpha/(1-alpha)))^(1/(omega-1));
    k   = h*(alpha/(rstar+delta))^(1/(1-alpha));
    y   = k^alpha*h^(1-alpha);
    i   = delta*k;
    c   = y-i-rstar*d;
    tb  = exp(y-c-i-phi/2*(k-k)^2);
    tby = exp(log(tb)/y);
    ca  = exp(-(d-d));
    cay = exp(log(ca)/y);
    Uc  = (c-1/omega*h^omega)^(-sigma);
    la  = Uc;
    Uh  = (1-alpha)*la*y/h;
end;

steady;

shocks;
var eps=sigma_eps^2;
end;

stoch_simul(order=1,irf=10,loglinear,contemporaneous_correlation) y c i h tby cay ; 
           
%%%%%% MATCHING

x_start=[rho etatilde phi psi]; %use calibration as starting point, pongo los parametros que quiero calibrar, el orden no es importante
%make sure Dynare does not print out stuff during runs
options_.nofunctions=1;
options_.nograph=1;
options_.verbosity=0;
%set noprint option to suppress error messages within optimizer
options_.noprint=1;     %no-print the results

% set csminwel options
H0   = 0.05*eye(length(x_start)); %Initial Hessian, GUESS INICIAL
crit = 1e-8;                      %Tolerance
nit  = 1000;                      %Number of iterations

target=[3.0406; 0.9960; 5.6157; 0.4135];%los parametros que yo quiero machear OJO AqUI

[fhat,x_opt_hat] = csminwel(@moment_objective,x_start,H0,[],crit,nit,target,oo_, M_,options_); %x_opt_hat sera el nuevo vector de parametros calibrados

set_param_value('rho',x_opt_hat(1)); %we get the new sigmae which minimize the distance D
set_param_value('etatilde',x_opt_hat(2));    %we get the new rho which minimize the distance D
set_param_value('phi',x_opt_hat(3)); %we get the new phi which minimize the distance D
set_param_value('psi',x_opt_hat(4)); %we get the new psi which minimize the distance D

options_.noprint=0;                     %print the results
stoch_simul(order=1,loglinear,irf=20);


