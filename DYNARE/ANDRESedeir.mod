% Andrés Gatty
% Edeir model

var y c i h k r d A tby tb ca cay
    la Uc Uh;  

predetermined_variables k; 

varexo eps;

parameters sigma delta rstar alpha omega dbar psi phi rho etatilde
           beta sigma_eps;

sigma   = 2;                 %MENDOZA
delta   = 0.1;               %depreciation rate
rstar   = 0.04;              %long-run interest rate
alpha   = 0.32;              %F(k,h) = k^ALFA h^(1-ALFA)
omega   = 1.455;             %Frisch ela st. from Mendoza 1991
dbar    = 0.7442;            %debt
psi     = 0.000742;          %debt elasticity of interest rate
phi     = 0.028;             %capital adjustment cost
rho     = 0.42;              %persistence of TFP shock
etatilde= 0.0129;            %sd of innovation to TFP shock
beta    = 1/(1+rstar);
sigma_eps = 1;

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
    log(A) = rho*log(A(-1)) + etatilde*eps;
    
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
     