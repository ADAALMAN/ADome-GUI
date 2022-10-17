function result = SerialRead(COMPort, datatype) 
    data = read(COMPort, 50, 'uint8');
    while (isempty(data) == true)
        data = read(COMPort, 50, 'uint8');
    end 
    
    if (strcmp(datatype, "ASCII") == true)
        ASCIIData = char(data);
    elseif(strcmp(datatype, "HEX") == true)
        dataArr = table2cell(array2table(data));
        for a = 1:length(dataArr)
            if ((dataArr{1,a} < 0) || (dataArr{1,a} > 15))
                ASCIIData{1,a} = char(dataArr{1,a});
            elseif (dataArr{1,a} > 9) && (dataArr{1,a} < 15)
                ASCIIData{1,a} = hex2dec(dataArr{1,a});
            else
                ASCIIData{1,a} = dataArr{1,a};
            end
        end
        
    end

    result = ASCIIData;
end