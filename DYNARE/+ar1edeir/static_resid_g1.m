function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
% function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = ar1edeir.static_g1_tt(T, y, x, params);
    end
    residual = ar1edeir.static_resid(T, y, x, params, false);
    g1       = ar1edeir.static_g1(T, y, x, params, false);

end
