function [startaddr octat]=GetRangeIPv4(IPv4)

IPv4=split(IPv4,'/');
octat=0;
if(length(IPv4)==1)
    octat=0;
else
    octat=str2num(IPv4{2});
end
IP=IPv4{1};
IPArray=split(IP,'.');
IP1=str2num(IPArray{1});
IP1=(IP1*16777216);
%IP1=de2bi(IP1)
IP2=str2num(IPArray{2});
IP2=(IP2*262144);
%IP2=de2bi(IP2)
IP3=str2num(IPArray{3});
IP3=(IP3*256);
%IP3=de2bi(IP3)
IP4=str2num(IPArray{4});
IP4=(IP4*1);
%IP4=de2bi(IP4)
IPSum=IP1+IP2+IP3+IP4;
IPSum=de2bi(IPSum);
divider=1;
for i=0:octat
    divider=divider*10;
end
startaddr= bitshift(bi2de(IPSum),-(32-octat));
end
