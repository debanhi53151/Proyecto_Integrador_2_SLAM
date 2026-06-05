function [xCorr, Pcorr] = correccionEKF(xPred,Ppred,z,H,R)
% Corrección EKF con observaciones LiDAR
% z: medición
% H: matriz de observación
% R: covarianza de la medición

K = Ppred*H'/(H*Ppred*H' + R);
xCorr = xPred + K*(z - H*xPred);
Pcorr = (eye(size(Ppred))-K*H)*Ppred;
end
