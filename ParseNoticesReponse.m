function ParseNoticesReponse(NoticesObj)
for k=1:numel(NoticesObj)
    NoticeSubObj=NoticesObj(k)
    if isfield(NoticeSubObj,'title')
            disp('title');
            disp(NoticeSubObj.title);
    end
    if isfield(NoticeSubObj,'description')
        disp('description');
        for r=1:length(NoticeSubObj.description)
            disp(NoticeSubObj.description(r));
        end
    end
    if isfield(NoticeSubObj,'links')
        disp('notices.links');
        ParseLinksReponse(NoticeSubObj.links);
    end
end
end