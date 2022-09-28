function result = SerialRead(COMPort, datatype) 
    data = read(COMPort, 20, 'uint8');
    while (isempty(data) == true)
        data = read(COMPort, 20, 'uint8');
    end 
    
    if (strcmp(datatype, "ASCII") == true)
        ASCIIData = char(data);
    elseif(strcmp(datatype, "HEX") == true)
        ASCIIData = hex2dec(data);
    end

    result = ASCIIData;
end