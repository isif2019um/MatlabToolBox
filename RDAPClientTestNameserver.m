function RDAPClientTestNameserver(Domain, Nameserver)
rdapClient=RDAPClient("FEB2020");
FullDSQueryURL=rdapClient.GetDomainAuthoritativeURL(Domain);
if(FullDSQueryURL~="error")
    query=strcat(strcat(FullDSQueryURL,"nameserver/"),Nameserver);
    [StatusCode JSONReponse] = FetchRawDataWebReadAPI(query);
    if(StatusCode == 200)
        ParseNameserverReponse(JSONReponse);
    else
        disp("query or RDAP server error ");
    end
end