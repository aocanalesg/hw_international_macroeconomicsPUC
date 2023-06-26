%Compilation

results_prob2(:,1) = [sqrt(oo_.var(1,1)) sqrt(oo_.var(2,2)) sqrt(oo_.var(3,3)) sqrt(oo_.var(4,4)) sqrt(oo_.var(9,9)) sqrt(oo_.var(12,12))]'
results_prob2(:,2)=[oo_.autocorr{1,1}(1,1) oo_.autocorr{1,1}(2,2) oo_.autocorr{1,1}(3,3) oo_.autocorr{1,1}(4,4) oo_.autocorr{1,1}(9,9) oo_.autocorr{1,1}(12,12)]'

%results_std_round=varfun(@(x)round(x,2), results_std);

%Export to excel

rowNames1_std = {'s_y','s_c/s_y','s_g/s_y','s_i/s_y','s_x/s_y','s_m/s_y', 's_(tb)'};%"s" represents standard deviation
colNames1_std = {'Linear Nic','Linear USA','Quadratic Nic','Quadratic USA', 'HP con λ = 100 Nic','HP con λ = 100 USA','HP con λ = 6.25 Nic','HP con λ = 6.25 USA'};
results_std = array2table(results_std,'RowNames',rowNames1_std,'VariableNames',colNames1_std);
results_std_round=varfun(@(x)round(x,2), results_std) %round to the nearest hundredth
filename = 'Resultados_std.xlsx';
writetable(results_std_round,filename);