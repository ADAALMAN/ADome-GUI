function AdomeStructure(app)
    
    [B, V] = bucky;
    
    for i = 1:60
        for j = 1:60
            if i == j
                continue
            end
    
            dist = (V(i,1)-V(j,1))^2 + (V(i,2)-V(j,2))^2 + (V(i,3)-V(j,3))^2;
            
            if (sqrt(dist) < 0.5) && V(i,3) > -0.3 && V(j,3) > -0.3
                plot3(app.UIAxes, [V(i,1) V(j,1)], [V(i,2) V(j,2)], [V(i,3) V(j,3)], "r" )
                hold (app.UIAxes, "on")
            end
    
        end
    end
end