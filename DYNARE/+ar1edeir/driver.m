%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'ar1edeir';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eps'};
M_.exo_names_tex(1) = {'eps'};
M_.exo_names_long(1) = {'eps'};
M_.endo_names = cell(15,1);
M_.endo_names_tex = cell(15,1);
M_.endo_names_long = cell(15,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'i'};
M_.endo_names_tex(3) = {'i'};
M_.endo_names_long(3) = {'i'};
M_.endo_names(4) = {'h'};
M_.endo_names_tex(4) = {'h'};
M_.endo_names_long(4) = {'h'};
M_.endo_names(5) = {'k'};
M_.endo_names_tex(5) = {'k'};
M_.endo_names_long(5) = {'k'};
M_.endo_names(6) = {'r'};
M_.endo_names_tex(6) = {'r'};
M_.endo_names_long(6) = {'r'};
M_.endo_names(7) = {'d'};
M_.endo_names_tex(7) = {'d'};
M_.endo_names_long(7) = {'d'};
M_.endo_names(8) = {'A'};
M_.endo_names_tex(8) = {'A'};
M_.endo_names_long(8) = {'A'};
M_.endo_names(9) = {'tby'};
M_.endo_names_tex(9) = {'tby'};
M_.endo_names_long(9) = {'tby'};
M_.endo_names(10) = {'tb'};
M_.endo_names_tex(10) = {'tb'};
M_.endo_names_long(10) = {'tb'};
M_.endo_names(11) = {'ca'};
M_.endo_names_tex(11) = {'ca'};
M_.endo_names_long(11) = {'ca'};
M_.endo_names(12) = {'cay'};
M_.endo_names_tex(12) = {'cay'};
M_.endo_names_long(12) = {'cay'};
M_.endo_names(13) = {'la'};
M_.endo_names_tex(13) = {'la'};
M_.endo_names_long(13) = {'la'};
M_.endo_names(14) = {'Uc'};
M_.endo_names_tex(14) = {'Uc'};
M_.endo_names_long(14) = {'Uc'};
M_.endo_names(15) = {'Uh'};
M_.endo_names_tex(15) = {'Uh'};
M_.endo_names_long(15) = {'Uh'};
M_.endo_partitions = struct();
M_.param_names = cell(12,1);
M_.param_names_tex = cell(12,1);
M_.param_names_long = cell(12,1);
M_.param_names(1) = {'sigma'};
M_.param_names_tex(1) = {'sigma'};
M_.param_names_long(1) = {'sigma'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'delta'};
M_.param_names_long(2) = {'delta'};
M_.param_names(3) = {'rstar'};
M_.param_names_tex(3) = {'rstar'};
M_.param_names_long(3) = {'rstar'};
M_.param_names(4) = {'alpha'};
M_.param_names_tex(4) = {'alpha'};
M_.param_names_long(4) = {'alpha'};
M_.param_names(5) = {'omega'};
M_.param_names_tex(5) = {'omega'};
M_.param_names_long(5) = {'omega'};
M_.param_names(6) = {'dbar'};
M_.param_names_tex(6) = {'dbar'};
M_.param_names_long(6) = {'dbar'};
M_.param_names(7) = {'psi'};
M_.param_names_tex(7) = {'psi'};
M_.param_names_long(7) = {'psi'};
M_.param_names(8) = {'phi'};
M_.param_names_tex(8) = {'phi'};
M_.param_names_long(8) = {'phi'};
M_.param_names(9) = {'rho'};
M_.param_names_tex(9) = {'rho'};
M_.param_names_long(9) = {'rho'};
M_.param_names(10) = {'etatilde'};
M_.param_names_tex(10) = {'etatilde'};
M_.param_names_long(10) = {'etatilde'};
M_.param_names(11) = {'beta'};
M_.param_names_tex(11) = {'beta'};
M_.param_names_long(11) = {'beta'};
M_.param_names(12) = {'sigma_eps'};
M_.param_names_tex(12) = {'sigma\_eps'};
M_.param_names_long(12) = {'sigma_eps'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 15;
M_.param_nbr = 12;
M_.orig_endo_nbr = 15;
M_.aux_vars = [];
M_.predetermined_variables = [ 5 ];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 15;
M_.eq_nbr = 15;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 5 20;
 0 6 0;
 0 7 0;
 0 8 0;
 1 9 21;
 2 10 0;
 3 11 0;
 4 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 22;
 0 18 0;
 0 19 0;]';
M_.nstatic = 9;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [7; 2; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'la' ;
  2 , 'name' , 'Uc' ;
  3 , 'name' , 'Uh' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'y' ;
  9 , 'name' , 'k' ;
  10 , 'name' , 'r' ;
  11 , 'name' , '11' ;
  12 , 'name' , '12' ;
  13 , 'name' , '13' ;
  14 , 'name' , '14' ;
  15 , 'name' , '15' ;
};
M_.mapping.y.eqidx = [3 4 7 8 11 12 14 ];
M_.mapping.c.eqidx = [5 6 7 11 ];
M_.mapping.i.eqidx = [7 9 11 ];
M_.mapping.h.eqidx = [3 5 6 8 ];
M_.mapping.k.eqidx = [4 7 8 9 11 ];
M_.mapping.r.eqidx = [1 7 10 ];
M_.mapping.d.eqidx = [7 10 13 ];
M_.mapping.A.eqidx = [8 15 ];
M_.mapping.tby.eqidx = [12 ];
M_.mapping.tb.eqidx = [11 12 ];
M_.mapping.ca.eqidx = [13 14 ];
M_.mapping.cay.eqidx = [14 ];
M_.mapping.la.eqidx = [1 2 3 4 ];
M_.mapping.Uc.eqidx = [2 5 ];
M_.mapping.Uh.eqidx = [3 6 ];
M_.mapping.eps.eqidx = [15 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [5 6 7 8 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(15, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(12, 1);
M_.endo_trends = struct('deflator', cell(15, 1), 'log_deflator', cell(15, 1), 'growth_factor', cell(15, 1), 'log_growth_factor', cell(15, 1));
M_.NNZDerivatives = [56; -1; -1; ];
M_.static_tmp_nbr = [6; 2; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 2;
sigma = M_.params(1);
M_.params(2) = 0.1;
delta = M_.params(2);
M_.params(3) = 0.04;
rstar = M_.params(3);
M_.params(4) = 0.32;
alpha = M_.params(4);
M_.params(5) = 1.455;
omega = M_.params(5);
M_.params(6) = 0.7442;
dbar = M_.params(6);
M_.params(7) = 0.000742;
psi = M_.params(7);
M_.params(8) = 0.028;
phi = M_.params(8);
M_.params(9) = 0.42;
rho = M_.params(9);
M_.params(10) = 0.0129;
etatilde = M_.params(10);
M_.params(11) = 1/(1+M_.params(3));
beta = M_.params(11);
M_.params(12) = 3.08;
sigma_eps = M_.params(12);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(12)^2;
options_.contemporaneous_correlation = true;
options_.irf = 10;
options_.loglinear = true;
options_.order = 1;
var_list_ = {'y';'c';'i';'h';'tby';'cay'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'ar1edeir_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ar1edeir_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ar1edeir_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ar1edeir_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ar1edeir_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ar1edeir_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ar1edeir_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
