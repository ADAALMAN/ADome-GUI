function outputTextbox(TextArea, cmdData, start)
    persistent firstLine;
    persistent endlines;
    
    if isempty(firstLine)
        firstLine = 1;
        endlines = 0;
    end

    a = firstLine;
    if (a == 1)
        while (strcmp(cmdData{a}, '#end#') == false)
            data = cmdData{a};
            TextArea.Value{a} = data;
            a = a + 1;
        end
    elseif (a > 1)
        endlines = endlines + 1;
        while (strcmp(cmdData{a}, '#end#') == false)
            data = cmdData{a};
            TextArea.Value{a - endlines} = data;
            a = a + 1;
        end
    end
    scroll(TextArea, 'bottom')
    firstLine = start;
end