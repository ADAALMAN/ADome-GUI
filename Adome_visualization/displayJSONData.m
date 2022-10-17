function displayJSONData(UITable, JSONData, amountOfLeds)
            UITable.Data = {};
            UITable.ColumnFormat = {'shortG'};

            nodeColumn = 1;
            ledColumn = 2;
            foundColumn = 3;
            thetaColumn = 4;
            phiColumn = 5;
            xColumn = 6;
            yColumn = 7;
            zColumn = 8;
            a = 1;
            l = 1;
            antennaRow = 1;
            ledRow = 1;

            antennaArray = jsondecode(JSONData); %Turn to local variable to access struct
            while(antennaArray.Antennas(a).id <= antennaArray.Antennas(end).id)
                UITable.Data{antennaRow, nodeColumn} = antennaArray.Antennas(a).id;
                
                
                while(antennaArray.Antennas(a).leds(l).id <= antennaArray.Antennas(a).leds(end).id)
                    UITable.Data{ledRow, ledColumn} = antennaArray.Antennas(a).leds(l).id;
                    UITable.Data{ledRow, foundColumn} = antennaArray.Antennas(a).leds(l).found;
                    UITable.Data{ledRow, thetaColumn} = antennaArray.Antennas(a).leds(l).theta;
                    UITable.Data{ledRow, phiColumn} = antennaArray.Antennas(a).leds(l).phi;
                    
                    [X1, Y1, Z1] = angle2cart(antennaArray.Antennas(a).leds(l).phi*pi/180, ...
                                              antennaArray.Antennas(a).leds(l).theta*pi/180, ...
                                              1);
                    TH = 60;
                    x = X1;
                    y = Y1*cos(TH) - Z1*sin(TH);
                    z = -(Y1*sin(TH) + Z1*cos(TH));
                    UITable.Data{ledRow, xColumn} = x;
                    UITable.Data{ledRow, yColumn} = y;
                    UITable.Data{ledRow, zColumn} = z;

%                     if (antennaArray.Antennas(a).leds(l).found == false) %if the led is not found
%                         s = uistyle('BackgroundColor',[1.00 0.00 0.00]);%turn cell color red
%                         addStyle(UITable,s,'cell',[ledRow,foundColumn]);
%                     else
%                         s = uistyle('BackgroundColor',[0.00 0.00 0.00]);%turn cell color back to default
%                         addStyle(UITable,s,'cell',[ledRow,foundColumn]);
%                     end

                    lEnd = antennaArray.Antennas(a).leds(end).id;
                    if (l == lEnd) 
                        l = 1;
                        break;
                    else
                        l = l + 1;
                        ledRow = ledRow + 1;
                    end
                end
                
                aEnd = antennaArray.Antennas(end).id + 1;
                if (a == aEnd)
                    a = 1;
                    break;
                else 
                    a = a + 1;
                    antennaRow = antennaRow + amountOfLeds;
                    ledRow = antennaRow;
                end
            end
        end