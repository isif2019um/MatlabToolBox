function [startaddr prefix]=GetRangeIPv6(FillIpv6Array,Ipv6mask)
Iterate=64-str2num(Ipv6mask);
prefix=Ipv6mask
OneStrIPv6Start="";
startaddr="";
for i=1:4
    OneStrIPv6Start=strcat(OneStrIPv6Start,FillIpv6Array(i));
end
OneStrIPv6Start;
StrBin=dec2bin(hex2dec(OneStrIPv6Start));
Iterate
if(Iterate>1)
    startaddr=StrBin(1:Iterate);
else
    startaddr=StrBin;
end
startaddr=bin2dec(startaddr);

end

