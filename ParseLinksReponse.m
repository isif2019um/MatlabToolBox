function ParseLinksReponse(LinksObj)
for k=1:length(LinksObj)
    LinksObjSub=LinksObj(k);
    if isfield(LinksObjSub,'href')
        disp('href:');
        disp(LinksObjSub.href);
    else
        disp("error: links dont have href");
    end
    if isfield(LinksObjSub,'value')
            disp('value:');
            disp(LinksObjSub.value);
    end
    if isfield(LinksObjSub,'rel')
            disp('rel:');
            disp(LinksObjSub.rel);
    end
    if isfield(LinksObjSub,'hreflang')
            disp('hreflang:');
            disp(LinksObjSub.hreflang);
    end
    if isfield(LinksObjSub,'title')
            disp('title:');
            disp(LinksObjSub.title);
    end
    if isfield(LinksObjSub,'media')
            disp('media:');
            disp(LinksObjSub.media);
    end
    if isfield(LinksObjSub,'type')
            disp('type:');
            disp(LinksObjSub.type);
    end
        
end
end