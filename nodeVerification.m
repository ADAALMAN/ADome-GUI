function allNodesFound = nodeVerification(antennaArray)
    a = 1;
            l = 1;
            while(app.antennaArray.Antennas(a).id <= app.antennaArray.Antennas(end).id)             
                while(app.antennaArray.Antennas(a).leds(l).id <= app.antennaArray.Antennas(a).leds(end).id)
                    if(app.decodedJSONData.Antennas(a).leds(l).found == false)
                        allNodesFound = false;
                        break;
                    else
                        
                    end   
                    lEnd = app.antennaArray.Antennas(a).leds(end).id;
                    if (l == lEnd) 
                        l = 1;
                        break;
                    else
                        l = l + 1;
                    end
                end
             end
                
                aEnd = app.antennaArray.Antennas(end).id + 1;
                if (a == aEnd)
                    a = 1;
                    break;
                else 
                    a = a + 1;
                end
            end

    
 end