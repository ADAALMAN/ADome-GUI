function AdomeStructure(axes)
    cla(axes)
    [B, V] = bucky;
    for i = 1:60
        for j = 1:60
            if i == j
                continue
            end
    
            dist = (V(i,1)-V(j,1))^2 + (V(i,2)-V(j,2))^2 + (V(i,3)-V(j,3))^2;
            
            if (sqrt(dist) < 0.5) && V(i,3) > -0.6 && V(j,3) > -0.6
                plot3(axes, [V(i,1) V(j,1)], [V(i,2) V(j,2)], [V(i,3) V(j,3)], "r" )
                hold (axes, "on")
            end
            
            
            if (sqrt(dist) > 0.5 && sqrt(dist) < 0.7) && (V(i,3) > -0.6 && V(i,3) < -0.5) && (V(j,3) > -0.6 && V(j,3) < -0.5)
                plot3(axes, [V(i,1) V(j,1)], [V(i,2) V(j,2)], [V(i,3) V(j,3)], "r" )
            end
        end
    end
end