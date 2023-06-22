% neoclassical growth model

% Endogenous variables
var y c k A;

% Exogenous variables
varexo e;

% Parameters
parameters alpha beta delta sigma rho sigmae ;
    alpha   = 1/3;
    beta    = 0.98;
    delta   = 0.025;
    sigma   = 1;
    rho     = 0.5;
    sigmae  = 0.01;

model;
    c^(-sigma) = beta * c(+1)^(-sigma) *(alpha*A(+1)*k^(alpha-1)+1-delta);
    c+k = y+(1-delta)*k(-1);
    y=A*k(-1)^alpha;
    log(A) = rho*log(A(-1)) + sigmae*e;
end;

initval;
    A = 1;
    k = 20;
    y = 2;
    c = 2;
end;


steady;
check;

shocks;
    var e=1;
end;

%Linealizar el modelo
%stoch_simul(order=1,irf=20);

%Log-linealizar el modelo
stoch_simul(order=1,loglinear,irf=20, periods=1000, nograph, noprint);
