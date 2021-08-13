function ParsePublicIDsReponse(PubicIDInput)
    disp('publicIds {}:');
    %PubicIDInput
    %PublicIDObj=PubicIDInput.publicIds;
    if isfield(PubicIDInput,'type')
        disp('type');
        disp(PubicIDInput.type);
    end
    if isfield(PubicIDInput,'identifier')
        disp('identifier');
        disp(PubicIDInput.identifier);
    end
end