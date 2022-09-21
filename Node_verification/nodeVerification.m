function allNodesFound = nodeVerification(antennaArray)
    allNodesFound = true;
    a = 1;
    l = 1;
    while(antennaArray.Antennas(a).id <= antennaArray.Antennas(end).id)             
        while(antennaArray.Antennas(a).leds(l).id <= antennaArray.Antennas(a).leds(end).id)
            if(antennaArray.Antennas(a).leds(l).found == false)
                allNodesFound = false;
                fprintf('Node: %.0f, Led: %.0f has not been found.\n', antennaArray.Antennas(a).id, antennaArray.Antennas(a).leds(l).id)
                %disp('Node: ', antennaArray.Antennas(a).id, ' Led: ', antennaArray.Antennas(a).leds(l).id, ' has not been found.') 
            end   

            lEnd = antennaArray.Antennas(a).leds(end).id;
            if (l == lEnd) 
                l = 1;
                break;
            else
                l = l + 1;
            end
        end
        
        aEnd = antennaArray.Antennas(end).id + 1;
        if (a == aEnd)
            a = 1;
            break;
        else 
            a = a + 1;
        end
    end

    if (allNodesFound == true)
        fprintf('All nodes have been found\n')
    end
end
