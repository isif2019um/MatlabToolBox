function RDAPClientTestDNS(Domain)

rdapClient=RDAPClient("FEB2020");
%"europa.eu"
FullDNSQueryURL=rdapClient.GetDomainAuthoritativeURL(Domain);
FullDNSQueryURL;
%return;
if(FullDNSQueryURL~="error")
    disp("Authoritative Domain name: ");
    disp(FullDNSQueryURL);
    query=strcat(strcat(FullDNSQueryURL,"domain/"),Domain);
    [StatusCode JSONReponse] = FetchRawDataWebReadAPI(query);
    if(StatusCode == 200)
        ParseDNSReponse(JSONReponse);
    else
        disp("query or RDAP server error ");
    end
end