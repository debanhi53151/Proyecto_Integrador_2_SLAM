function dibujarMapaOcupacion(L,trayectoria)
% Visualiza mapa y trayectoria
imagesc(flipud(L>0)); colormap(gray);
hold on;
plot(trayectoria(:,1),size(L,1)-trayectoria(:,2),'g-','LineWidth',2);
xlabel('x [celdas]'); ylabel('y [celdas]');
title('Mapa de ocupación con trayectoria');
end
