function RDAPClientTestPunnycode(Domain)

rdapPcode=Punycode("UTF-8");
ReturnEncode=rdapPcode.Encode(rdapPcode,Domain);
disp("Enocded Domain name: ");
disp(ReturnEncode);
ReturnDecode=rdapPcode.Decode(rdapPcode,ReturnEncode);
disp("Decoded Domain name: ");
disp(ReturnDecode);
if(ReturnDecode~="error")
    disp("Successful PunnyCode Operation");
end
end