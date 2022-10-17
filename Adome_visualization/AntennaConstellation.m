function AntennaConstellation(axes, TH, PH)
    %tilt coordinates from x-axis to z-axis (original data was pointing to side)
    [X1,Y1,Z1] = angle2cart(PH*pi/180,TH*pi/180,1);
    
    %Rotation Around X-axis:
    theta=60; %theta 0 results in an offset from the bucky
    x = X1;
    y = Y1*cos(theta) - Z1*sin(theta);
    z = -(Y1*sin(theta) + Z1*cos(theta));
    
    for i = 1:length(TH)
                id{i} = i;
    end

    nodes = plot3(axes, z, y, x, '.','markersize', 20);
    dtRows = [dataTipTextRow("Id:",id),... 
              dataTipTextRow("X:",z),... 
              dataTipTextRow("Y:",y),... 
              dataTipTextRow("Z:",x),...
              dataTipTextRow("Theta:",TH),... 
              dataTipTextRow("Phi:",PH)];
    nodes.DataTipTemplate.DataTipRows = dtRows;
end