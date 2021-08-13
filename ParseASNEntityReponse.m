function ParseASNEntityReponse(ASNEntityObj)
if isfield(ASNEntityObj,'objectClassName')
    disp('objectClassName:');
    disp(ASNEntityObj.objectClassName);
end
if isfield(ASNEntityObj,'handle')
    disp('handle:');
    disp(ASNEntityObj.handle);
end
if isfield(ASNEntityObj,'startAutnum')
    disp('startAutnum:');
    disp(ASNEntityObj.startAutnum );
end
if isfield(ASNEntityObj,'endAutnum')
    disp('endAutnum:');
    disp(ASNEntityObj.endAutnum );
end
if isfield(ASNEntityObj,'name')
    disp('name:');
    disp(ASNEntityObj.name );
end
if isfield(ASNEntityObj,'type')
    disp('type:');
    disp(ASNEntityObj.type );
end
if isfield(ASNEntityObj,'status')
    disp('status:');
    for k=1:numel(ASNEntityObj.status)
        disp(ASNEntityObj.status(k));
    end
end
if isfield(ASNEntityObj,'country')
    disp('country:');
    disp(ASNEntityObj.country  );
end
if isfield(ASNEntityObj,'entities')
    disp('entities:');
    ParseEntitiesReponse(ASNEntityObj.entities);
end
if isfield(ASNEntityObj,'remarks')
    disp('remarks:');
    ParseRemarksReponse(ASNEntityObj.remarks );
end
if isfield(ASNEntityObj,'links')
    disp('links:');
    ParseLinksReponse(ASNEntityObj.links);
end
if isfield(ASNEntityObj,'port43')
    disp('port43:');
    disp(ASNEntityObj.port43);
end
if isfield(ASNEntityObj,'events')
    disp('events:');
    ParseEventsReponse(ASNEntityObj.events);
end
end