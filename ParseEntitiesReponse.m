function ParseEntitiesReponse(InputEntities)
for k=1:numel(InputEntities)
    %InputEntities(k)
    if isfield(InputEntities(k),'objectClassName')
        disp('objectClassName:');
        disp(InputEntities(k).objectClassName);
    end
    if isfield(InputEntities(k),'handle')
        disp('handle:');
        disp(InputEntities(k).handle);  
    end
    if isfield(InputEntities(k),'roles')
        disp('roles[]:');
        for l=1:numel(InputEntities(k).roles)
            disp(InputEntities(k).roles(l));
        end
    end
    if isfield(InputEntities(k),'publicIds')
        disp('status:');
        ParsePublicIDsReponse(InputEntities(k).publicIds);
    end
    if isfield(InputEntities(k),'vcardArray')
        disp('vcardArray');
        ParseVcardArrayReponse(InputEntities(k).vcardArray);
    end
    
    if isfield(InputEntities(k),'remarks')
        disp('remarks:');
        ParseRemarksReponse(InputEntities(k).remarks);
    end
    if isfield(InputEntities(k),'links')
        disp('links:');
        ParseLinksReponse(InputEntities(k).links);
    end
    if isfield(InputEntities(k),'events')
        disp('events:');
        ParseEventsReponse(InputEntities(k).events);
    end
    if isfield(InputEntities(k),'asEventActor')
        disp('asEventActor:');
        ParseEventsReponse(InputEntities(k).asEventActor);
    end
    if isfield(InputEntities(k),'status')
        disp('status:');
        disp(InputEntities(k).status);
    end
    if isfield(InputEntities(k),'networks')
        disp('networks:');
        ParseIPNetworkReponse(InputEntities(k).networks);
    end
    if isfield(InputEntities(k),'autnums')
        disp('autnums:');
        disp(InputEntities(k).autnums);
    end
    if isfield(InputEntities(k),'entities')
        disp('entities:');
        ParseEntitiesReponse(InputEntities(k).entities);
    end
end
end