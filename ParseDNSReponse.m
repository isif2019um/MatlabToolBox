function ParseDNSResponse(DNSList)
if isfield(DNSList,'objectClassName')
    disp(DNSList.objectClassName);
end
if isfield(DNSList,'handle')
    disp(DNSList.handle);
end
if isfield(DNSList,'ldhName')
    disp(DNSList.ldhName);
end
if isfield(DNSList,'unicodeName')
    disp(DNSList.unicodeName);
end
if isfield(DNSList,'variants')
    ParseVariantsReponse(DNSList.variants); 
end
if isfield(DNSList,'nameservers')
    ParseNameserverReponse(DNSList.nameservers ); 
end
if isfield(DNSList,'secureDNS')
    ParseSecureDNSReponse(DNSList.secureDNS); 
end
if isfield(DNSList,'entities')
    ParseEntitiesReponse(DNSList.entities);
end
if isfield(DNSList,'status')
    for k=1:numel(DNSList.status)
        disp(DNSList.status(k));
    end
end
if isfield(DNSList,'publicIds')
    ParsePublicIDsReponse(DNSList.publicIds);
end
if isfield(DNSList,'remarks')
    ParseRemarksReponse(DNSList.remarks );
end
if isfield(DNSList,'links')
    ParseLinksReponse(DNSList.links);
end
if isfield(DNSList,'port43')
    disp(DNSList.port43);
end
if isfield(DNSList,'events')
    ParseEventsReponse(DNSList.events);
end
if isfield(DNSList,'network')
    ParseIPNetworkReponse(DNSList.network );
end

end