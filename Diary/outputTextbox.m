function outputTextbox(TextArea)
    persistent lastcheck;

    if isempty(lastcheck)
        lastcheck = 0;
    end

    fid = fopen('Diary/AdomeGUIOutput.log', 'r');
    check = strjoin(string(char(fread(fid))),'');
    if strcmp(check, lastcheck) == false
            rawData = splitlines(check);
            for i = 1:length(rawData)
                TextArea.Value{i} = rawData{i};
            end
            %outputTextbox(app.TextArea, rawData);
    else
        %do nothing
    end
    lastcheck = check;
    fclose(fid);
end