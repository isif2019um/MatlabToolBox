function RDAPClientTestSearchDomain(Value, SearchType)

fname = 'dns.json'; 
fid = fopen(fname); 
raw = fread(fid,inf); 
str = char(raw'); 
fclose(fid); 
FUllListofDNSURLs={};
DNSJsonObject = jsondecode(str);
disp('The Base URL for DNS Input is:');
DNSList=DNSJsonObject(1).services;
for k=1:length(DNSList)
    for l=1:length(DNSList{k})
        DNSList{k}{1};
        DNSList{k}{2};
        for m=1:length(DNSList{k}{2})
            %DNSList{k}{l+1}{1}
            DNSList{k}{2}{m};
            FUllListofDNSURLs=[FUllListofDNSURLs DNSList{k}{2}{m}];
        end
    end
end
Uniquwlist=unique(FUllListofDNSURLs);
for index=1:length(Uniquwlist)
    rdapClient=RDAPClient("FEB2020");
    if(SearchType=="name")
        query=strcat(strcat(Uniquwlist{index},"domains?name="),Value)
        [StatusCode JSONReponse] = FetchRawData(query);
        if(StatusCode == 200 )
            ParseDNSReponse(JSONReponse);
        elseif(StatusCode>=400 && StatusCode<=500)
        else
            disp("query or RDAP server error ");
        end    
    elseif(SearchType=="nameserver")
        query=strcat(strcat(Uniquwlist{index},"domains/nsLdhName="),Value);
        [StatusCode JSONReponse] = FetchRawData(query);
        if(StatusCode == 200)
            JSONReponse
            ParseDNSReponse(JSONReponse);
        else
            disp("query or RDAP server error ");
        end
    elseif(SearchType=="ipaddress")
        query=strcat(strcat(Uniquwlist{index},"domain/nsIp="),Value);
        [StatusCode JSONReponse] = FetchRawDataWebReadAPI(query);
        if(StatusCode == 200)
            JSONReponse.errorCode
            ParseDNSReponse(JSONReponse);
        else
            disp("query or RDAP server error ");
        end    
    else
        disp("invalid search option");
        break;
    end
end
end