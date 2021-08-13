function ParseNameserverReponse(ParseNameserver)
for i=1:length(ParseNameserver)
    
    if isfield(ParseNameserver(i),'objectClassName')
        disp(ParseNameserver(i).objectClassName);
    end
    if isfield(ParseNameserver,'handle')
        disp(ParseNameserver(i).handle);
    end
    if isfield(ParseNameserver,'ldhName')
        disp(ParseNameserver(i).ldhName);
    end
    if isfield(ParseNameserver(i),'unicodeName')
        disp(ParseNameserver(i).unicodeName);
    end
    if isfield(ParseNameserver(i),'status')
        disp('status:');
        for k=1:numel(ParseNameserver(i).status)
            disp(ParseNameserver(i).status(k));
        end
    end
    if isfield(ParseNameserver(i),'ipAddresses')
        disp('ipAddresses:');
        IPObj=ParseNameserver(i).ipAddresses;
        for k=1:numel(IPObj.v4)
            disp(IPObj.v4(k));
        end
        for l=1:numel(IPObj.v6)
            disp(IPObj.v6(l));
        end
    end
    if isfield(ParseNameserver(i),'remarks')
        ParseRemarksReponse(ParseNameserver(i).remarks);
    end
    if isfield(ParseNameserver(i),'links')
        ParseLinksReponse(ParseNameserver(i).links);
    end
    if isfield(ParseNameserver(i),'port43')
        disp(ParseNameserver(i).port43);
    end
    if isfield(ParseNameserver(i),'events')
        ParseEventsReponse(ParseNameserver(i).events);
    end
    %disp(DNSList.entities);
    if isfield(ParseNameserver(i),'entities')
        ParseEntitiesReponse(ParseNameserver(i).entities);
    end
    if isfield(ParseNameserver,'rdapConformance')
        disp('rdapConformance:');
        for i=1:length(ParseNameserver.rdapConformance)
            disp(ParseNameserver.rdapConformance(i));
        end
    end
    if isfield(ParseNameserver,'notices')
        disp('notices:');
        ParseNoticesReponse(ParseNameserver.notices);
    end
end
end