function json = mockJSON(COMPort, numberOfAntennas, numberOfLedsPerAntenna, numberOfTrials)
    COMPort;
    found = true;
    theta = 2.000000;
    phi = 1.000000;
    numberOfTrials;

    JSONFILE_name= sprintf('Adome_Antennas.json');
    fid = fopen(JSONFILE_name, "w");

    for a = 1:+1:numberOfAntennas
        antennaId{a} = a-1;
    end
    for l = 1:+1:numberOfLedsPerAntenna
        ledId{l} = l;
    end
    
    led = struct("id", ledId, "found", found, "theta", theta, "phi", phi);
    antenna = struct("id", antennaId, "leds", led);
    array = struct("Antennas", antenna);
    JSON = jsonencode(array, PrettyPrint=true);
    fprintf(fid, JSON);
    fclose("all");
end
