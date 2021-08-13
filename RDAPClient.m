classdef RDAPClient
    properties
        ICANN_RDAP_Profile="FEB2020";
        Query;
        %IANABootStrapJsonFile=("dns.json","ipv4.json","ipv6.json","asn.json","object-tags.json");
    end
    methods (Static)
           function obj = RDAPClient(ICANNRDAPProfile)
              obj.ICANN_RDAP_Profile=ICANNRDAPProfile;
           end
           function DNSQueryURL =GetDomainAuthoritativeURL(UserInputDomain)
                fname = 'dns.json'; 
                fid = fopen(fname); 
                raw = fread(fid,inf); 
                str = char(raw'); 
                fclose(fid); 
                DNSJsonObject = jsondecode(str);
                dnsValue=UserInputDomain;
                ArryMatchStr = {};
                ArryMatchURL = {};
                ArryTLDs = {};
                ArryFoundTLDs = {};
                DNSValue2TLD='';
                DNSValue3TLD='';
                IndexOfLastDot=strfind(UserInputDomain,'.');
                %Get last most Tld name
                strlength(UserInputDomain);
                IndexOfLastDot(numel(IndexOfLastDot));
                NewDomainVal = extractBetween(UserInputDomain,IndexOfLastDot(numel(IndexOfLastDot))+1,strlength(UserInputDomain));
                IArrURIPath=strfind(UserInputDomain,'/');
                numel(IArrURIPath);
                if(numel(IArrURIPath)==0)
                    %disp('domain regisrrt offset is');
                    disp(NewDomainVal);
                else
                    IndexOfLastDot(numel(IndexOfLastDot));
                    IArrURIPath(1);
                    strlength(UserInputDomain);
                    FinalValueDomain=extractBetween(UserInputDomain,IndexOfLastDot(numel(IndexOfLastDot))+1,IArrURIPath(1)-1);
                    %disp('domain regisrrt offset is');
                    NewDomainVal=FinalValueDomain;
                end
                numel(NewDomainVal);
                i=0;
                for i=1:(numel(IndexOfLastDot)-1)
                    ArryTLDs{length(ArryTLDs)+1}=extractBetween(UserInputDomain,IndexOfLastDot(i)+1,IndexOfLastDot(i+1)-1);
                end
                 ArryTLDs{length(ArryTLDs)+1}=NewDomainVal;
                ArryTLDs;
                DNSListObj=DNSJsonObject(1).services;
                for i=1:numel(ArryTLDs)
                    for k=1:length(DNSListObj)
                        for l=1:length(DNSListObj{k})
                            found_subd=0;
                            for m=1:length(DNSListObj{k}{l})
                                DNSListObj{k}{l};
                                numel(DNSListObj{k}{l});
                                if(found_subd==0)
                                    if(numel(DNSListObj{k}{l})==1 )
                                        if(strcmp(ArryTLDs{i},DNSListObj{k}{l}{m})==1)
                                            %disp('adding - if');
                                            DNSListObj{k}{l};
                                            ArryFoundTLDs{length(ArryFoundTLDs)+1}=ArryTLDs{i};
                                            %disp("settig found_subd=1");
                                            found_subd=1;
                                        end
                                    else
                                        for ii=1:numel(DNSListObj{k}{l})
                                            if(found_subd==0)
                                                TMP=DNSListObj{k}{l}(ii);
                                                TMP2=string(TMP{1}+"");
                                                ArryTLDs{i};
                                                if(strcmp(ArryTLDs{i},TMP2)==1)
                                                    ArryFoundTLDs{length(ArryFoundTLDs)+1}=ArryTLDs{i};
                                                    DNSListObj{k}{l}
                                                    numel(DNSListObj{k}{l});
                                                    found_subd=1;
                                                end
                                            end

                                        end

                                    end
                                end
                                
                            end
                        end
                    end
                end
                % Now we have these confirm LTDs domain in Uer input
                % {["com"] ["pk"]}
                %disp("array found final=");
                numel(ArryFoundTLDs);
                ArryFoundTLDsURLs={};
                ArryFoundTLDsName={};
                ArryFoundTLDsWeight={};
                % now we need to search best base URL of our 
                % lets add all possible base URL to 
                found=0;
                for i=1:numel(ArryFoundTLDs)
                   %disp('Trying to FInd:')
                   DNSListObj=DNSJsonObject(1).services;
                    for k=1:length(DNSListObj)
                        for l=1:length(DNSListObj{k})
                            found_mul=0;
                                for m=1:length(DNSListObj{k}{l})
                                    if(found_mul==0)
                                        if(numel(ArryFoundTLDs)==1)
                                            if(strcmp(ArryFoundTLDs{i},DNSListObj{k}{l}{m})==1)
                                                numel(DNSListObj{k}{l});
                                                DNSListObj{k}{l};
                                                ArryFoundTLDsName{length(ArryFoundTLDsName)+1}=DNSListObj{k}{l}{m};
                                                ArryFoundTLDsURLs{length(ArryFoundTLDsURLs)+1}=DNSListObj{k}{l+1}{1};
                                                ArryFoundTLDsWeight{length(ArryFoundTLDsWeight)+1}=1;
                                                found_mul=1;
                                            end
                                        else
                                            count=0;
                                            if(found_mul==0)
                                                for p=1:numel(ArryFoundTLDs)
                                                        if(ArryFoundTLDs{p}==DNSListObj{k}{l}{numel(DNSListObj)})
                                                            count=count+1;
                                                        end
                                                end
                                                if(count==numel(ArryFoundTLDs))
                                                    ArryFoundTLDsName{length(ArryFoundTLDsName)+1}=DNSListObj{k}{l}{m};
                                                    ArryFoundTLDsURLs{length(ArryFoundTLDsURLs)+1}=DNSListObj{k}{l+1}{1};
                                                    ArryFoundTLDsWeight{length(ArryFoundTLDsWeight)+1}=numel(ArryFoundTLDs);
                                                    found_mul=1;
                                                end
                                            end
                                        end
                                    end
                                end
                        end
                    end
                end
                if(numel(ArryFoundTLDsURLs)==1)
                    DNSQueryURL=ArryFoundTLDsURLs{1};
                else
                    maxVal=1;
                    Maxurl="";
                    maxVal=ArryFoundTLDsWeight(1);
                    Maxurl=ArryFoundTLDsURLs(1);
                    for(i=1:numel(ArryFoundTLDsWeight))
                        if(ArryFoundTLDsWeight(i)>maxval)
                            maxVal=ArryFoundTLDsWeight(i);
                            Maxurl=ArryFoundTLDsURLs(i);
                        end
                    end
                    DNSQueryURL=Maxurl;
                end
                
           end
           function IPv4QueryURL=GetIPv4AuthoritativeURL(UserInputDomain)
                   fname = 'ipv4.json'; 
                    fid = fopen(fname); 
                    raw = fread(fid,inf); 
                    str = char(raw'); 
                    fclose(fid); 
                    DNSJsonObject = jsondecode(str);
                    dnsValue=UserInputDomain;
                    ArryMatchStr = {};
                    ArryMatchURL = {};
                    ArryMatchStart = {};
                    dnsValue=split(dnsValue,'.');
                    IntIP=str2num(dnsValue(1));
                    %disp('The Base URL for IPv4 Input is:');
                    DNSList=DNSJsonObject(1).services;
                    for k=1:length(DNSList)
                        for l=1:+2:length(DNSList{k})
                            for m=1:length(DNSList{k}{l})
                                IANAValue=split(DNSList{k}{l}{m},'.');
                                IANAValIntCurrent=str2num(string(IANAValue(1)));
                                if((IntIP==IANAValIntCurrent))
                                    [startaddr octat]=GetRangeIPv4(DNSList{k}{l}{m});
                                    %disp('NewMatch=');
                                    %disp(startaddr);
                                    ArryMatchStr{length(ArryMatchStr)+1}=DNSList{k}{l}{m};
                                    ArryMatchURL{length(ArryMatchURL)+1}=DNSList{k}{l+1}{1};
                                    ArryMatchStart{length(ArryMatchStart)+1}=startaddr;
                                end
                            end
                        end
                    end
                    if(length(ArryMatchURL)==1 && length(ArryMatchURL)==1)
                        for k=1:length(ArryMatchStr)
                            UserInputDomain=strcat("ip/",UserInputDomain);
                            IPv4QueryURL=strcat(ArryMatchURL{k},UserInputDomain);
                        end
                    elseif (length(ArryMatchURL)<1 && length(ArryMatchURL)<1)
                         IPv4QueryURL="error";
                    else
                        UserOctat=split(UserInputDomain,'/');
                        UserOctat=str2num(UserOctat(2));
                        Max=0;
                        Diff=0;
                        Min=4294967295;
                        index=1;
                        [startaddrUeserInput octUeserInput]=GetRangeIPv4(UserInputDomain)
                        for k=1:length(ArryMatchStr)
                            [startaddr oct]=GetRangeIPv4(ArryMatchStr{k});
                            if(startaddr<startaddrUeserInput)
                                Diff=startaddrUeserInput-startaddr;
                                if(Diff<Min)
                                    Min=Diff;
                                    index=k;
                                end
                            end
                        end
                        UserInputDomain=strcat("ip/",UserInputDomain);
                        IPv4QueryURL=strcat(ArryMatchURL{index},UserInputDomain)
                    end
           end
           function IPv6QueryURL=GetIPv6AuthoritativeURL(UserInputDomain)
                fname = 'ipv6.json'; 
                fid = fopen(fname); 
                raw = fread(fid,inf); 
                str = char(raw'); 
                fclose(fid); 
                DNSJsonObject = jsondecode(str);
                dnsValue=UserInputDomain;
                ArryMatchStr = {};
                ArryMatchURL = {};
                ArryMatchStart = {};
                IPv6QueryURL="error";
                %FillIpv6Array;
                [FillIpv6Array,Ipv6mask]=GetIPv6ArrPreix(dnsValue);
                [startaddr prefix]=GetRangeIPv6(FillIpv6Array,Ipv6mask);
                FillIpv6Array;
                Ipv6mask;
                IntIP=str2num(Ipv6mask);
                disp('The Base URL for IPv6 Input is:');
                DNSList=DNSJsonObject(1).services;
                for k=1:length(DNSList)
                    for l=1:+2:length(DNSList{k})
                        for m=1:length(DNSList{k}{l})
                            match=0;
                            Tmp="";
                            if contains(DNSList{k}{l}{m},'::')
                                Tmp=split(DNSList{k}{l}{m},"::");
                                Tmp=Tmp(1);
                                if contains(Tmp,':')
                                        Tmp=split(Tmp,":");
                                else
                                    Tmp=Tmp;
                                end
                                %Tmp=split(Tmp,":");
                            else
                                if contains(DNSList{k}{l}{m},'/')
                                    Tmp=split(DNSList{k}{l}{m},"/");
                                    Tmp=Tmp(1);
                                    if contains(Tmp,':')
                                        Tmp=split(Tmp,":");
                                    else
                                        Tmp=Tmp;
                                    end
                                else
                                    if contains(DNSList{k}{l}{m},':')
                                        Tmp=split(DNSList{k}{l}{m},":");
                                    else
                                        Tmp=DNSList{k}{l}{m};
                                    end
                                end
                            end
                            Tmp;
                            length(Tmp);
                            [FillIpv6ArrayIANA Ipv6maskIANA]=GetIPv6ArrPreix(DNSList{k}{l}{m});
                            if(FillIpv6ArrayIANA (1)==FillIpv6Array(1) && (length(Tmp)==1))
                                startaddr;
                                length(Tmp);
                                [startaddrIANA prefixIANA]=GetRangeIPv6(FillIpv6ArrayIANA,Ipv6maskIANA{1});
                                if(startaddrIANA>=startaddr)                        
                                    ArryMatchStr{length(ArryMatchStr)+1}=DNSList{k}{l}{m};
                                    ArryMatchURL{length(ArryMatchURL)+1}=DNSList{k}{l+1}{1};
                                end
                            elseif(FillIpv6ArrayIANA(1)==FillIpv6Array(1) && (length(Tmp)==2)  )
                                startaddr;
                                length(Tmp);
                                hex2dec(FillIpv6ArrayIANA(2));
                                hex2dec(FillIpv6Array(2));
                                if(double(hex2dec(FillIpv6ArrayIANA(2))>=double(hex2dec(FillIpv6Array(2)))))
                                    ArryMatchStr{length(ArryMatchStr)+1}=DNSList{k}{l}{m};
                                    ArryMatchURL{length(ArryMatchURL)+1}=DNSList{k}{l+1}{1};
                                end
                            elseif(FillIpv6ArrayIANA (1)==FillIpv6Array(1) && (length(Tmp)==3)&& FillIpv6ArrayIANA (2)==FillIpv6Array(2)&& FillIpv6ArrayIANA (3)==FillIpv6Array(3) )
                                startaddr;
                                length(Tmp);
                                [startaddrIANA prefixIANA]=GetRangeIPv6(FillIpv6ArrayIANA,Ipv6maskIANA{1});
                                if(startaddrIANA<=startaddr)                        
                                    ArryMatchStr{length(ArryMatchStr)+1}=DNSList{k}{l}{m};
                                    ArryMatchURL{length(ArryMatchURL)+1}=DNSList{k}{l+1}{1};
                                end

                            else

                            end
                        end
                    end
                end
                if(length(ArryMatchURL)==1 && length(ArryMatchURL)==1)
                    for k=1:length(ArryMatchStr)
                        IPv6QueryURL=ArryMatchURL(k);
                    end
                elseif (length(ArryMatchURL)<1 && length(ArryMatchURL)<1)
                     IPv6QueryURL="error";
                else
                    UserOctat=str2num(Ipv6mask);
                    index=1;
                    for k=1:length(ArryMatchStr)
                        oct=split(ArryMatchStr{k},'/');
                        oct=oct(2);
                        oct=str2num(string(oct));
                        Diff=oct;
                        if(oct<=UserOctat)
                            index=k;
                        end
                    end
                    IPv6QueryURL=unique(ArryMatchURL);
                end
           end
            function ASNQueryURL=GetASNAuthoritativeURL(UserInputDomain)
                fname = 'asn.json'; 
                fid = fopen(fname); 
                raw = fread(fid,inf); 
                str = char(raw'); 
                fclose(fid); 
                DNSJsonObject = jsondecode(str);
                dnsValue=str2num(UserInputDomain);
                ArryMatchStr = {};
                ArryMatchURL = {};
                ArryMatchStart = {};
                
                disp('The Base URL for ASN is:');
                DNSList=DNSJsonObject(1).services;
                for k=1:length(DNSList)
                    for l=1:+2:length(DNSList{k})
                        for m=1:length(DNSList{k}{l})
                            match=0;
                            IANAASN=split(DNSList{k}{l}{m},'-');
                            if(length(IANAASN)==1)
                                startasn=(IANAASN(1));
                                edasn=(IANAASN(1));
                                startasn=str2num(startasn{1});
                                edasn=str2num(edasn{1});
                            else
                                startasn=(IANAASN(1));
                                edasn=(IANAASN(2));
                                startasn=str2num(startasn{1});
                                edasn=str2num(edasn{1});
                            end
                            if((dnsValue>=startasn) && (dnsValue<=edasn))
                                ArryMatchStr{length(ArryMatchStr)+1}=DNSList{k}{l}{m};
                                ArryMatchURL{length(ArryMatchURL)+1}=DNSList{k}{l+1}{1};

                            end                
                        end
                    end
                end
                if(length(ArryMatchURL)==1 && length(ArryMatchURL)==1)
                    for k=1:length(ArryMatchStr)
                        ASNQueryURL=ArryMatchURL{k};
                    end
                else
                    ASNQueryURL="error";
                end

            end
            function NameserverQueryUrl=RDAPClientTestNameserver(UserInputDomain)
                fname = 'asn.json'; 
                fid = fopen(fname); 
                raw = fread(fid,inf); 
                str = char(raw'); 
                fclose(fid); 
                DNSJsonObject = jsondecode(str);
                dnsValue=str2num(UserInputDomain);
                ArryMatchStr = {};
                ArryMatchURL = {};
                ArryMatchStart = {};
                
                disp('The Base URL for ASN is:');
                DNSList=DNSJsonObject(1).services;
                for k=1:length(DNSList)
                    for l=1:+2:length(DNSList{k})
                        for m=1:length(DNSList{k}{l})
                            match=0;
                            IANAASN=split(DNSList{k}{l}{m},'-');
                            if(length(IANAASN)==1)
                                startasn=(IANAASN(1));
                                edasn=(IANAASN(1));
                                startasn=str2num(startasn{1});
                                edasn=str2num(edasn{1});
                            else
                                startasn=(IANAASN(1));
                                edasn=(IANAASN(2));
                                startasn=str2num(startasn{1});
                                edasn=str2num(edasn{1});
                            end
                            if((dnsValue>=startasn) && (dnsValue<=edasn))
                                ArryMatchStr{length(ArryMatchStr)+1}=DNSList{k}{l}{m};
                                ArryMatchURL{length(ArryMatchURL)+1}=DNSList{k}{l+1}{1};

                            end                
                        end
                    end
                end
                
                if(length(ArryMatchURL)==1 && length(ArryMatchURL)==1)
                    for k=1:length(ArryMatchStr)
                        ASNQueryURL=ArryMatchURL{k};
                    end
                else
                    ASNQueryURL="error";
                end

            end
    end
end
