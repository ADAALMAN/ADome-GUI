function s = initiateSerialPort(serialPortAddress, numberOfBoards)
% Create serialport with correct baud rate and timeout of X seconds
s = serialport(serialPortAddress, 115200, 'Timeout', 1);
configureTerminator(s,"CR/LF") % set end of line with '\r\n'
%Set readout settings
write(s, ['b' numberOfBoards], "uint8"); % Set number of [b]oards
write(s, ['d' 20], "uint8"); % Set sample [d]elay in us
%OLD: writeline(s, ['a' num2str(1)]); % moving [a]verage
pause(1e-3);
end