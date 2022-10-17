function [x,y,z] = angle2cart(th, ph, r, degRad)
if nargin > 3 
    if strcmp(degRad,'deg')
        ph = ph .* pi ./ 180;
        th = th .* pi ./ 180;
    end
end
x = r .* sin(th).* cos(ph);
y = r .* sin(th).* sin(ph);
z = r .* cos(th);
end