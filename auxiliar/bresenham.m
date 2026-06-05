function [x, y] = bresenham(x1, y1, x2, y2)
% Algoritmo de Bresenham para trazar una línea discreta entre dos puntos
% Inputs:
%   (x1,y1) : celda inicial
%   (x2,y2) : celda final
% Outputs:
%   x, y    : vectores con las coordenadas de las celdas recorridas

x1 = round(x1); y1 = round(y1);
x2 = round(x2); y2 = round(y2);

dx = abs(x2 - x1);
dy = abs(y2 - y1);

sx = sign(x2 - x1);
sy = sign(y2 - y1);

x = x1;
y = y1;

if dx > dy
    err = dx / 2;
    while x ~= x2
        x(end+1) = x(end) + sx;
        y(end+1) = y(end);
        err = err - dy;
        if err < 0
            y(end) = y(end) + sy;
            err = err + dx;
        end
    end
else
    err = dy / 2;
    while y ~= y2
        x(end+1) = x(end);
        y(end+1) = y(end) + sy;
        err = err - dx;
        if err < 0
            x(end) = x(end) + sx;
            err = err + dy;
        end
    end
end
end
