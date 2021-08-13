function fullIPv6=GetFullIPv6(IPv6)

IPv6=split(IPv6,'/');
prefix=0;
if(length(IPv6)==1)
    prefix=0;
else
    prefix=str2num(IPv6{2});
end
max=8;
IP=IPv6{1};
IPArray=split(IP,'::');
IPArrayPost=IPArray(2);
IPArrayPre=IPArray(1);
if(contains(IPArrayPre,':'))
    IPArrayPre=split(IPArrayPre,':');
end
if(contains(IPArrayPost,':'))
    IPArrayPost=split(IPArrayPost,':');
end
IPArrayPostSize=0;
if(isempty(IPArrayPost{1}))
    IPArrayPostSize=0;
else
    IPArrayPostSize=length(IPArrayPost);
end
length(IPArrayPost);
length(IPArrayPre);
indexPre=1;
indexPost=1;
finalIPArray=["","","","","","","",""];
for i=1:length(IPArrayPre)
    finalIPArray(i)=IPArrayPre(i);
    indexPre=indexPre+1;
end
indexPre;
finalIPArray;
for i=1:(8-length(IPArrayPre)-IPArrayPostSize)
    finalIPArray(indexPre)="0000";
    indexPre=indexPre+1;
end
indexPre;
finalIPArray;
length(IPArrayPost);
for i=1:1:(9-indexPre)
    if(indexPre>=9)
        break;
    end
    finalIPArray(indexPre)=IPArrayPost(i);
    indexPre=indexPre+1;
end
indexPre;
fullIPv6=finalIPArray;

end