function RDAPClientTestASN(Domain)

rdapClient=RDAPClient("FEB2020");
ASNQueryURL=rdapClient.GetASNAuthoritativeURL(Domain);
disp("Authoritative Domain name: ");
disp(ASNQueryURL);
if(ASNQueryURL~="error")
    query=strcat(strcat(ASNQueryURL,"autnum/"),Domain);
    [StatusCode JSONReponse] = FetchRawDataWebReadAPI(query);
    if(StatusCode == 200)
        ParseASNEntityReponse(JSONReponse);
    elseif(StatusCode == 400)
        %ParseIPNetworkReponse(JSONReponse);
        disp("StatusCode is 400");
    elseif(StatusCode == 500)
        %ParseIPNetworkReponse(JSONReponse);
        disp("StatusCode is 400");
    else
        disp("query or RDAP server error ");
    end
end