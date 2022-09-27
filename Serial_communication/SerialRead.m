function result = SerialRead(COMPort, datatype) 
    data = read(COMPort, 20, 'uint8');
    
    if (strcmp(datatype, "ASCII") == true)
        ASCIIData = char(data);
    elseif(strcmp(datatype, "HEX") == true)
        ASCIIData = hex2dec(data);
    end

    result = ASCIIData;
end