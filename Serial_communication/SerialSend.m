function result = SerialSend(COMPort, serialData)
    write(COMPort, serialData, 'uint8');
end