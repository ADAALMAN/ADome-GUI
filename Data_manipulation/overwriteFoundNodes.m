function antennaArray = overwriteFoundNodes(antennaArray, decodedJSONData)
            a = 1;
            l = 1;
            while(antennaArray.Antennas(a).id <= antennaArray.Antennas(end).id)             
                while(antennaArray.Antennas(a).leds(l).id <= antennaArray.Antennas(a).leds(end).id)
                    if(decodedJSONData.Antennas(a).leds(l).found == true)
                        antennaArray.Antennas(a).leds(l).found = decodedJSONData.Antennas(a).leds(l).found;
                        antennaArray.Antennas(a).leds(l).theta = decodedJSONData.Antennas(a).leds(l).theta;
                        antennaArray.Antennas(a).leds(l).phi = decodedJSONData.Antennas(a).leds(l).phi;
                    else
                        antennaArray.Antennas(a).leds(l).found = antennaArray.Antennas(a).leds(l).found;
                        antennaArray.Antennas(a).leds(l).theta = antennaArray.Antennas(a).leds(l).theta;
                        antennaArray.Antennas(a).leds(l).phi = antennaArray.Antennas(a).leds(l).phi;
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
        end