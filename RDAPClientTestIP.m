function IDNToASCIIConverter(Domain)

rdapClient=RDAPClient("FEB2020");
FullIPQueryURL=rdapClient.GetIPv4AuthoritativeURL(Domain);
disp("Authoritative Domain name: ");
disp(FullIPQueryURL);
if(FullIPQueryURL~="error")
    [StatusCode JSONReponse] = FetchRawDataWebReadAPI(FullIPQueryURL);
    if(StatusCode == 200)
        ParseIPNetworkReponse(JSONReponse);
    else
        disp("query or RDAP server error ");
    end
end
end