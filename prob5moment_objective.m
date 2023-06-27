function [D]=moment_objective(xopt,target,oo_, M_,options_)
% function  [D]=moment_objective(xopt,target, other options)
% Computes the quadratic deviation of the simulated moments from the empirical
% ones; does so by calling stoch_simul.m 
%
% Inputs:
%   xopt                [npar by 1]             vector of parameters in current optimization step
%   target              [ntargets]              vector of targets 
%
% Outputs:
%   D                   [scalar]                value of the objective function
% Codes based in Johannes Pfeifer
%% set parameter for use in Dynare
 
M_.params(strmatch('rho',M_.param_names,'exact')) = xopt(1);  % rho AQUI SE DEBE CAMBIAR DEPENDIENDO DE QUE MOMENTOS QUIERES MACHEAR
M_.params(strmatch('etatilde',M_.param_names,'exact'))    = xopt(2);  %rho AQUI SE DEBE CAMBIAR DEPENDIENDO DE QUE MOMENTOS QUIERES MACHEAR
M_.params(strmatch('phi',M_.param_names,'exact'))    = xopt(2); % phi
M_.params(strmatch('psi',M_.param_names,'exact'))    = xopt(2); % psi

%El siguiente if se utiliza solamente si deseas agregar una restriccion a
%alguno de los parametros
 %if any(xopt(2)<=-1) || any(xopt(2)>0.8)   %make sure coefficient PSSI is between 0 and 0.5
 %    D=10e6+sum([xopt].^2);              %penalty function
 %    return                              % return to csminwel - do not execute the rest of the code
 %end

var_list=M_.endo_names'; 

[info, oo_] = stoch_simul(M_, options_, oo_, var_list); 
%run stoch_simul to generate moments with the options specified in the mod-file
 if info %solution was not successful
     D=10e6+sum([xopt].^2); %return with penalty 
 else
%Colecting moments of the model 
    model_moments(1,1) = sqrt(oo_.var(1,1));      %we get sd of y in oo_.var oo_.var es una matriz de varianzas y covarianzas
    model_moments(2,1) = oo_.autocorr{1,1}(1,1);   %we get the autocorr of y in oo_.autocorr{1,1}
    model_moments(3,1) = sqrt(oo_.var(3,3));  %we get sd of i in oo_.var oo_.var es una matriz de varianzas y covarianzas
    model_moments(4,1) = sqrt(oo_.var(5,5));   %we get sd of tby in oo_.var oo_.var es una matriz de varianzas y covarianzas

%Defining z
    z = model_moments-target;
%Min distance (D)
    D=sqrt(z'*z);
end
