function ParseEntityObjectReponse(EntityObject)
if isfield(EntityObject,'objectClassName')
    disp(EntityObject.objectClassName);
end
if isfield(EntityObject,'handle')
    disp(EntityObject.handle);
end
if isfield(EntityObject,'vcardArray')
        disp('vcardArray');
        ParseVcardArrayReponse(EntityObject.vcardArray)
end
if isfield(EntityObject,'roles')
        disp('roles[]:');
        for l=1:numel(EntityObject.roles)
            disp(EntityObject.roles(l))
        end
end
if isfield(EntityObject,'publicIds')
        ParsePublicIDsReponse(EntityObject.publicIds);
end
if isfield(EntityObject,'entities')
    ParseEntitiesReponse(EntityObject.entities);
end
if isfield(EntityObject,'remarks')
    ParseRemarksReponse(EntityObject.remarks );
end
if isfield(EntityObject,'links')
    ParseLinksReponse(EntityObject.links);
end
if isfield(EntityObject,'events')
    ParseEventsReponse(EntityObject.events);
end
if isfield(EntityObject,'status')
    disp('status:');
    for k=1:numel(EntityObject.status)
        disp(EntityObject.status(k));
    end
end
if isfield(EntityObject,'port43')
    disp(EntityObject.port43);
end
if isfield(EntityObject,'network')
    ParseIPNetworkReponse(EntityObject.network );
end
if isfield(EntityObject,'autnums')
    ParseASNEntityReponse(EntityObject.autnums );
end
if isfield(EntityObject,'rdapConformance')
    disp('rdapConformance:');
    for i=1:length(EntityObject.rdapConformance)
        disp(EntityObject.rdapConformance(i));
    end
end
if isfield(EntityObject,'notices')
    disp('notices:');
    ParseNoticesReponse(EntityObject.notices);
end
end