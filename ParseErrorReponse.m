function ParseErrorReponse(ErrorResponce)
if isfield(ErrorResponce,'rdapConformance')
    disp('rdapConformance:');
    for i=1:length(ErrorResponce.rdapConformance)
        disp(ErrorResponce.rdapConformance(i));
    end
end
if isfield(ErrorResponce,'notices')
    disp('notices:');
    ParseNoticesReponse(ErrorResponce.notices);
end
if isfield(ErrorResponce,'lang')
    disp('lang:');
    disp(ErrorResponce.lang);
end
if isfield(ErrorResponce,'errorCode')
    disp('errorCode:');
    disp(ErrorResponce.errorCode);
end
if isfield(ErrorResponce,'title')
    disp('title:');
    disp(ErrorResponce.title); 
end
if isfield(ErrorResponce,'description')
    disp('description:');
    for i=1:length(ErrorResponce.description)
        disp(ErrorResponce.description{i} ); 
    end
end
end