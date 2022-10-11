function AdomeStructure(app)
    cla(app.UIAxes)
    [B, V] = bucky;
    for i = 1:60
        for j = 1:60
            if i == j
                continue
            end
    
            dist = (V(i,1)-V(j,1))^2 + (V(i,2)-V(j,2))^2 + (V(i,3)-V(j,3))^2;
            
            if (sqrt(dist) < 0.5) && V(i,3) > -0.6 && V(j,3) > -0.6
                plot3(app.UIAxes, [V(i,1) V(j,1)], [V(i,2) V(j,2)], [V(i,3) V(j,3)], "r" )
                hold (app.UIAxes, "on")
            end
            
            
            %if (V(i,3) > -0.9 && V(i,3) < -0.6) && (V(j,3) > -0.9 && V(j,3) < -0.6)
        end
    end
    plot3(app.UIAxes, [V(31,1) V(34,1)], [V(31,2) V(34,2)], [V(31,3) V(34,3)], "r")
    plot3(app.UIAxes, [V(34,1) V(36,1)], [V(34,2) V(36,2)], [V(34,3) V(36,3)], "r")
    plot3(app.UIAxes, [V(36,1) V(39,1)], [V(36,2) V(39,2)], [V(36,3) V(39,3)], "r")
    plot3(app.UIAxes, [V(39,1) V(41,1)], [V(39,2) V(41,2)], [V(39,3) V(41,3)], "r")
    plot3(app.UIAxes, [V(41,1) V(44,1)], [V(41,2) V(44,2)], [V(41,3) V(44,3)], "r")
    plot3(app.UIAxes, [V(44,1) V(46,1)], [V(44,2) V(46,2)], [V(44,3) V(46,3)], "r")
    plot3(app.UIAxes, [V(46,1) V(49,1)], [V(46,2) V(49,2)], [V(46,3) V(49,3)], "r")
    plot3(app.UIAxes, [V(49,1) V(51,1)], [V(49,2) V(51,2)], [V(49,3) V(51,3)], "r")
    plot3(app.UIAxes, [V(51,1) V(54,1)], [V(51,2) V(54,2)], [V(51,3) V(54,3)], "r")
    plot3(app.UIAxes, [V(54,1) V(31,1)], [V(54,2) V(31,2)], [V(54,3) V(31,3)], "r")
end