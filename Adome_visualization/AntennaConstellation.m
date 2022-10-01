function [x, y, z] = AntennaConstellation(TH, PH)
    %tilt coordinates from x-axis to z-axis (original data was pointing to side)
    [X1,Y1,Z1] = angle2cart(PH*pi/180,TH*pi/180,1);
    
    %Rotation Around X-axis:
    theta=60; %theta 0 results in an offset from the bucky
    x = X1;
    y = Y1*cos(theta) - Z1*sin(theta);
    z = -(Y1*sin(theta) + Z1*cos(theta));
end

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