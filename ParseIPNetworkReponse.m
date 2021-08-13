function ParseIPNetworkReponse(IPNetwork)

if isfield(IPNetwork,'rdapConformance')
    disp('rdapConformance:');
    for i=1:length(IPNetwork.rdapConformance)
        disp(IPNetwork.rdapConformance(i));
    end
end
if isfield(IPNetwork,'notices')
    disp('notices:');
    ParseNoticesReponse(IPNetwork.notices);
end
if isfield(IPNetwork,'handle')
    disp('handle:');
    disp(IPNetwork.handle);
end

if isfield(IPNetwork,'startAddress')
    disp('startAddress:');
    disp(IPNetwork.startAddress);
end
if isfield(IPNetwork,'endAddress')
    disp('endAddress:');
    disp(IPNetwork.endAddress);
end
if isfield(IPNetwork,'ipVersion')
    disp('ipVersion:');
    disp(IPNetwork.ipVersion);
end
if isfield(IPNetwork,'name')
    disp('name:');
    disp(IPNetwork.name );
end
if isfield(IPNetwork,'type')
    disp('type:');
    disp(IPNetwork.type );
end
if isfield(IPNetwork,'country')
    disp('country:');
    disp(IPNetwork.country  );
end
if isfield(IPNetwork,'parentHandle')
    disp('parentHandle:');
    disp(IPNetwork.parentHandle );
end
if isfield(IPNetwork,'events')
    disp('events:');
    ParseEventsReponse(IPNetwork.events);
end
if isfield(IPNetwork,'links')
    disp('links:');
    ParseLinksReponse(IPNetwork.links);
end
if isfield(IPNetwork,'entities')
    disp('entities:');
    ParseEntitiesReponse(IPNetwork.entities);
end
if isfield(IPNetwork,'port43')
    disp('port43:');
    disp(IPNetwork.port43);
end
if isfield(IPNetwork,'status')
    disp('status:');
    for k=1:numel(IPNetwork.status)
        disp(IPNetwork.status(k));
    end
end
if isfield(IPNetwork,'objectClassName')
    disp('objectClassName:');
    disp(IPNetwork.objectClassName);
end
if isfield(IPNetwork,'remarks')
    disp('remarks :');
    ParseRemarksReponse(IPNetwork.remarks );
end

end