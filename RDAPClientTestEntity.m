function RDAPClientTestEntity(Domain, entityhandle)
%the base URL is specified in IANA Bootstrap 
%Therefore we need to try out all registries base URL forn Domain 
rdapClient=RDAPClient("FEB2020");
FullDSQueryURL=rdapClient.GetDomainAuthoritativeURL(Domain);
if(FullDSQueryURL~="error")
    query=strcat(strcat(FullDSQueryURL,"entity/"),entityhandle);
    [StatusCode JSONReponse] = FetchRawDataWebReadAPI(query);
    if(StatusCode == 200)
        ParseEntityObjectReponse(JSONReponse);
    else
        disp("query or RDAP server error ");
    end
end