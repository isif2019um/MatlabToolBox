function ParseSecureDNSReponse(SecureDNS)
if isfield(SecureDNS,'secureDNS')
    SecureDNSObj=SecureDNS.secureDNS;
    if isfield(SecureDNSObj,'delegationSigned')
        disp('delegationSigned:');
        disp(SecureDNSObj.delegationSigned);
    end
    if isfield(SecureDNSObj,'zoneSigned ')
        disp('zoneSigned :');
        disp(SecureDNSObj.zoneSigned );
    end
    if isfield(SecureDNSObj,'maxSigLife ')
        disp('maxSigLife :');
        disp(SecureDNSObj.maxSigLife );
    end
    if isfield(SecureDNSObj,'dsData')
        disp('dsData:');
        %disp(SecureDNSObj.dsData);
        if isfield(SecureDNSObj.dsData,'keyTag')
            disp('keyTag :');
            disp(SecureDNSObj.dsData.keyTag  );
        end
        if isfield(SecureDNSObj.dsData,'algorithm')
            disp('algorithm  :');
            disp(SecureDNSObj.dsData.algorithm);
        end
        if isfield(SecureDNSObj.dsData,'digest')
            disp('digest:');
            disp(SecureDNSObj.dsData.digest);
        end
        if isfield(SecureDNSObj.dsData,'digestType')
            disp('digestType:');
            disp(SecureDNSObj.dsData.digestType);
        end
        if isfield(SecureDNSObj.dsData,'events')
            ParseEventsReponse(SecureDNSObj.dsData.events);
        end
        if isfield(SecureDNSObj.dsData,'links')
            ParseLinksReponse(SecureDNSObj.dsData.links);
        end
    end
    if isfield(SecureDNSObj,'keyData ')
        disp('keyData :');
        %disp(SecureDNSObj.dsData);
        if isfield(SecureDNSObj.keyData,'flags')
            disp('flags:');
            disp(SecureDNSObj.keyData.flags);
        end
        if isfield(SecureDNSObj.keyData,'protocol')
            disp('protocol:');
            disp(SecureDNSObj.keyData.protocol);
        end
        if isfield(SecureDNSObj.keyData,'publicKey')
            disp('publicKey:');
            disp(SecureDNSObj.keyData.publicKey);
        end
        if isfield(SecureDNSObj.keyData,'algorithm')
            disp('algorithm:');
            disp(SecureDNSObj.keyData.algorithm);
        end
        if isfield(SecureDNSObj,'events')
            ParseEventsReponse(SecureDNSObj.keyData.events);
        end
        if isfield(SecureDNSObj.keyData,'links')
            ParseLinksReponse(SecureDNSObj.keyData.links);
        end
    end
end
end