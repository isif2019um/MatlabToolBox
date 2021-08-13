function ParseRemarksReponse(Remarks)
RemarksObj=Remarks;
for k=1:numel(RemarksObj)
    RemarksDesObj=RemarksObj(k);
    if isfield(RemarksDesObj,'description')
        disp('description:');
        RemarksDesArrObj=RemarksDesObj.description;
        for m=1:numel(RemarksDesArrObj)
           disp(RemarksDesArrObj(m));
        end
    end
    if isfield(RemarksDesObj,'title')
        disp('title');
        %RemarksDesObj.title
        disp(RemarksDesObj.title);
    end
end
end