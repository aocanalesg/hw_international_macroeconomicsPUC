function [residual, g1, g2, g3] = dynamic_resid_g1_g2_g3(T, y, x, params, steady_state, it_, T_flag)
% function [residual, g1, g2, g3] = dynamic_resid_g1_g2_g3(T, y, x, params, steady_state, it_, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = prob5edeir.dynamic_g3_tt(T, y, x, params, steady_state, it_);
    end
    [residual, g1, g2] = prob5edeir.dynamic_resid_g1_g2(T, y, x, params, steady_state, it_, false);
    g3       = prob5edeir.dynamic_g3(T, y, x, params, steady_state, it_, false);

end
