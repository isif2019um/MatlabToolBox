function ParseEventsReponse(InputEvents)
for k=1:numel(InputEvents)
        EventObj=InputEvents(k);
        if isfield(EventObj,'eventAction')
            disp('eventAction:');
            disp(EventObj.eventAction);
        end
        if isfield(EventObj,'eventActor')
            disp('eventActor:');
            disp(EventObj.eventActor);
        end
        if isfield(EventObj,'eventDate')
            disp('eventDate:');
            disp(EventObj.eventDate);
        end
end
end