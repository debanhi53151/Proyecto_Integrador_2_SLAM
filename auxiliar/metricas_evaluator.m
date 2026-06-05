function metricas_evaluator(trajOdom,trajAmcl,trajGT)
% Calcula métricas de calidad
errOdom = sqrt(sum((trajOdom-trajGT).^2,2));
errAmcl = sqrt(sum((trajAmcl-trajGT).^2,2));
fprintf('Error medio Odom: %.3f m\n',mean(errOdom));
fprintf('Error medio AMCL: %.3f m\n',mean(errAmcl));
end
