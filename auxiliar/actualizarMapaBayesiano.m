function L = actualizarMapaBayesiano(L, pose, scanMsg, resolution)
% Actualiza el mapa de ocupación con un escaneo LiDAR (LaserScan)
% Inputs:
%   L          : matriz log-odds del mapa
%   pose       : [x, y, theta] del robot en el mapa
%   scanMsg    : mensaje LaserScan (struct con Ranges, AngleMin, AngleIncrement, RangeMax)
%   resolution : tamaño de celda [m]

% Parámetros
eps = 1e-3;
ranges = double(scanMsg.Ranges(:));
N = numel(ranges);
angles = double(scanMsg.AngleMin + (0:N-1)' * scanMsg.AngleIncrement);

% Filtrar puntos válidos
mask = isfinite(ranges) & ...
       (ranges > scanMsg.RangeMin + eps) & ...
       (ranges < scanMsg.RangeMax - eps);

ranges = ranges(mask);
angles = angles(mask);

% Posición del robot en celdas
robotCell = round(pose(1:2) ./ resolution);

for j = 1:length(ranges)
    dist = ranges(j);
    theta = pose(3) + angles(j);

    % Celda final del rayo
    endCell = robotCell + round([cos(theta), sin(theta)] * dist / resolution);

    % Bresenham para recorrer celdas del rayo
    [xLine, yLine] = bresenham(robotCell(1), robotCell(2), endCell(1), endCell(2));

    % Actualizar celdas libres
    for k = 1:length(xLine)-1
        if yLine(k) > 0 && yLine(k) <= size(L,1) && ...
           xLine(k) > 0 && xLine(k) <= size(L,2)
            L(yLine(k), xLine(k)) = L(yLine(k), xLine(k)) + log(0.3/0.7);
        end
    end

    % Actualizar celda ocupada
    if yLine(end) > 0 && yLine(end) <= size(L,1) && ...
       xLine(end) > 0 && xLine(end) <= size(L,2)
        L(yLine(end), xLine(end)) = L(yLine(end), xLine(end)) + log(0.7/0.3);
    end
end
end
