function json = mockJSON(COMPort, numberOfAntennas, numberOfLedsPerAntenna, numberOfTrials)
    COMPort;
    found = true;
    theta = [-7.1 -41.1 -37.1 -58.3 -58.3 -37.4 -40.7 -7.1 16.3 47.2 56.6 43.4 56.7 47.2 16.3 6.4 -16.5 -16.5 6.4 20.1 0];
    phi = [148.4 136.9 113.7 101.6 78.4 66.2 43.3 31.6 49.2 49.2 71.0 90.0 108.9 130.8 130.8 109.1 101.6 78.4 70.9 90.0 90];  
    numberOfTrials;

    JSONFILE_name= sprintf('Mock_JSON/Adome_Antennas.json');
    fid = fopen(JSONFILE_name, "w");

    for a = 1:+1:numberOfAntennas
        antennaId{a} = a-1;
        
    end
    for l = 1:+1:numberOfLedsPerAntenna
        ledId{l} = l;
    end

    for i = 1:numberOfAntennas
        led{i} = struct("id", ledId, "found", found, "theta", theta(i), "phi", phi(i));
    end

    antenna = struct("id", antennaId, "leds", led);
    array = struct("Antennas", antenna);
    JSON = jsonencode(array, PrettyPrint=true);
    fprintf(fid, JSON);
    fclose("all");
end
