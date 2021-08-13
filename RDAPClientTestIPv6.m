function RDAPClientTestIPv6(Domain)
rdapClient=RDAPClient("FEB2020");
IPv6QueryURL=rdapClient.GetIPv6AuthoritativeURL(Domain);
if(IPv6QueryURL{1}~="error")
    query=strcat(strcat(IPv6QueryURL{1},"ip/"),Domain);
    disp("Authoritative Domain name for Ipv6: ");
    disp(IPv6QueryURL{1});
    [StatusCode JSONReponse] = FetchRawDataWebReadAPI(query);
    if(StatusCode == 200)
        ParseIPNetworkReponse(JSONReponse);
    elseif(StatusCode == 400)
        disp("StatusCode is 400");
    elseif(StatusCode == 500)
        disp("StatusCode is 400");
    else
        disp("query or RDAP server error ");
    end
end