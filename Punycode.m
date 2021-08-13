classdef Punycode
    properties
        BASE = 36;
        TMIN = 1;
        TMAX = 26;
        SKEW = 38;
        DAMP = 700;
        INITIAL_BIAS = 72;
        INITIAL_N = 128;
        PREFIX = 'xn--';
        DELIMITER = '-';
        encodeTable = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' '0' '1' '2' '3' '4' '5' '6' '7' '8' '9';];
        keySet = {'a', 'b', 'c', 'd', 'e', 'f' ,'g' ,'h' ,'i' ,'j' ,'k' ,'l' ,'m' ,'n' ,'o' ,'p' ,'q' ,'r' ,'s' ,'t' ,'u' ,'v', 'w', 'x', 'y', 'z' ,'0' ,'1' ,'2' ,'3', '4', '5', '6', '7', '8', '9'};
        valueSet = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35];
        decodeTable;
        encoding;
        codePointsGlobal;

    end
    methods (Static)
       function obj = Punycode( isencoded)
           obj.decodeTable  = containers.Map(obj.keySet,obj.valueSet);
           this.encoding="UTF-8";
           
       end
       function DecodeReturn= Decode(obj,input)
           input=lower(input);
           parts = strsplit(input,'.');
           for i=1:length(parts)
               length(parts{i});
               if((length(parts{i})<1)  || (length(parts{i})>63))
                   disp('The length of any one label is limited to between 1 and 63 octets');
               end
               parts{i};
               index   = strfind(parts{i}, obj.PREFIX);
               if index
                   parts{i}=strrep(parts{i},obj.PREFIX,'');
                    tmpparts=obj.decodePart(obj,parts{i});
                    class(tmpparts);
                    parts{i}=tmpparts;
                   
               else
                   continue;
                   
               end
               
           end
           if(length(parts{i})<255)
               DecodeReturn= strjoin(parts,'.');
           else
               disp('The length of any one label is limited to between 1 and 63 octets');
               DecodeReturn= 'Error Domain Length Exceeded';
           end
           
       end
       function PDecodeReturn = decodePart(obj,input)
           n = obj.INITIAL_N;
            i = 0;
            bias = obj.INITIAL_BIAS;
            output = '';
            %pos = strrpos($input, static::DELIMITER);
            pos = strfind(input, obj.DELIMITER);
            if (pos) 
                output = extractBetween(input,1,pos-1);
                pos=pos+1;
            else 
                pos = 0;
            end
            if (isequal(output, ''))
                outputLength = 0;
            else
                outputLength = length(output{1});
            end
            inputLength = length(input);
            while (pos < inputLength) 
                oldi = i;
                w = 1;
                k = obj.BASE;
                while (1)
                    input(pos+1);
                    digit = obj.decodeTable(input(pos+1));
                    pos=pos+1;
                    i = i + (digit * w);
                    t = obj.calculateThreshold(obj,k, bias);
                    k =k+ obj.BASE;
                    if (digit < t)
                        break;
                    end
                    w = w * (obj.BASE - t);
                    
                end
                outputLength=outputLength+1;
                i - oldi;
                bias = obj.Adapt(obj,i - oldi, outputLength, (oldi == 0));
                n = n +  (i / outputLength);
                i = mod(i , outputLength);
                if (isequal(output, ''))
                    output1 = extractBetween(output, 1, i);
                else
                    output1 = extractBetween(output{1}, 1, i);
                end
                n=fix(double(n));
                output2=obj.codePointToChar(obj,n);
                if (isequal(output, ''))
                    output3=extractBetween(output, i+1, outputLength - 1);
                else
                    output3=extractBetween(output{1}, i+1, outputLength - 1);
                end
                output=append(output1,output2,output3);
                
                i=i+1;
            end
            PDecodeReturn=char(output);
           
       end
       function EncodeReturn= Encode(obj,host)
           host = strtrim(host);
           host = lower( host );
           parts = strsplit(host,'.');
           for i=1:length(parts)
               length(parts{i});
               if(length(parts{i})<1)
                   disp('The length of any one label is limited to between 1 and 63 octets');
               else
                   parts{i}=obj.encodePart(obj,parts{i});
               end               
           end
           if(length(parts{i})<255)
               EncodeReturn= strjoin(parts,'.');
           else
               disp('The length of any one label is limited to between 1 and 63 octets');
               EncodeReturn= 'Error Domain Length Exceeded';
           end
       end
       function PEncodeReturn = encodePart(obj,part)
           codePoints=obj.listCodePoints(obj,part);
           n=obj.INITIAL_N;
           bias=obj.INITIAL_BIAS;
           delta=0;
           output = '';
           k1=1;
           AllArray=codePoints{1};
           BasicArray=codePoints{2};
           nonBasicArray=codePoints{3};
           h=numel(BasicArray);
           b=h;
           class(codePoints);
           for i=1:1:numel(BasicArray)
               
               output(length(output)+1)=obj.codePointToChar(obj,BasicArray{i});
           end
           
           if(string(part)==string(output))
               PEncodeReturn=output;
               return;
           end
           if (b>0)
               output(length(output)+1)=obj.DELIMITER;
           end
           nonBasicArray=unique(cell2mat(nonBasicArray.'));
           nonBasicArray=sort((nonBasicArray));
           class(nonBasicArray);
           i=1;
           part;
           retpart=obj.TransformToUnicodeChar(obj,part,length(part));
           partnew=retpart{1};
           
           class(part);
           lengthvar=length(part);
           h;
           output;
           
           while (h < lengthvar)
               h;
               lengthvar;
               m = nonBasicArray(i);
               i=i+1;    
               
               delta = delta + (m - n) * (h + 1);
               n = m;
               m;
               n;
               h;
               count=0;
               for j=1:1:length(AllArray )
                   count=count+1;
                   c=AllArray {j};
                    if (c < n || c < obj.INITIAL_N) 
                        delta=delta+1;
                    end
                    if (c == n)
                         q = delta;
                         k1 = obj.BASE;
                         while (1)
                             k1;
                             bias;
                             t = obj.calculateThreshold(obj,k1, bias);
                             t;
                             if (q < t)
                                 q;
                                 break;
                             end
                             code = t + mod((q - t) , (obj.BASE - t));
                             tmpEcodeChat1=obj.encodeTable(code+1);
                             output(length(output)+1) = tmpEcodeChat1;
                             output;
                             q = double((q - t) / (obj.BASE - t));
                             k1=k1+obj.BASE;
                         end
                         output;
                         if(q<1)
                             tmpEcodeChat2=obj.encodeTable(1);
                         else
                             tmpEcodeChat2=obj.encodeTable(q+1);
                         end
                         %output=strcat(output, obj.encodeTable(q));
                         output(length(output)+1) = tmpEcodeChat2;
                         bias = obj.Adapt(obj,delta, h + 1, (h == b));
                         delta = 0;
                         h=h+1;
                      end
               end
               delta=delta+1;
               n=n+1;
           end
           class(output);
           %disp('output and prefix');
           output;
           FinalOut=obj.PREFIX;
           for i=1:1:length(output)
               FinalOut(length(FinalOut)+1) = output(i);
           end
           length1 = length(FinalOut);
           if (length1 > 63 || length1 < 1) 
               disp('The length of any one label is limited to between 1 and 63 octets, but %s given.');
           end
           PEncodeReturn=FinalOut;
       end
       function listCodePointsReturn=listCodePoints(obj,input)
           numel(input);  
           AllArray = {1};
           BasicArray = {};
           nonBasicArray = {};
           iAllArray=1;
           iBasicArray=1;
           inonBasicArray=1;
           valueSet = cell(1,3);
           keySet = cell(1,3);
           keySet={'all', 'basic', 'nonBasic'};
           valueSet ={AllArray, BasicArray, nonBasicArray};
           codePoints = containers.Map(keySet,valueSet);
           codePoints ('all');
           codePoints ('basic');
           codePoints ('nonBasic');
           length =strlength(input);      
           for i=1:1:length
               charcter=input(i);;
               code=obj.charToCodePoint(obj,charcter);
               if code < 128
                   AllArray{iAllArray}=code;
                   BasicArray{iBasicArray}=code;
                   iBasicArray=iBasicArray+1;
                   iAllArray=iAllArray+1;
               else
                   AllArray{iAllArray}=code;
                   nonBasicArray{inonBasicArray}=code;
                   inonBasicArray=inonBasicArray+1;
                   iAllArray=iAllArray+1;
                   nonBasicArray;
               end          
           end
           codePoints('all') =AllArray;
           codePoints('basic')= BasicArray;
           codePoints('nonBasic')=nonBasicArray;
           listCodePointsReturn={AllArray,BasicArray,nonBasicArray};
       end
       function TransformToUnicodeCharRet=TransformToUnicodeChar(obj,str,newsize)
           newstr="";
           for i=1:1:length(str)
               charvalue=str(i);
               fid = fopen('ny2.txt','wt');
               fprintf(fid, charvalue);
               fclose(fid);
               fID2 = fopen('ny2.txt', 'r', 'n', 'UTF-8'); 
               bytes = fread(fID2);
               fclose(fID2);
               class(bytes);
               length(bytes);
               code = typecast(uint8(bytes), 'uint8');
               class(code);
               if(length(bytes)==1)
                   newstr(length(newstr)+1) = charvalue;
               elseif(length(bytes)==2)
                   val1=char(uint8(code(1:1)));
                   val2=char(uint8(code(2:2)));
                   newstr(length(newstr)+1)=val1;
                   newstr(length(newstr)+1)=val2;
                   newsize=newsize+1;
               elseif(length(bytes)==3)
                   val1=char(uint8(code(1:1)));
                   val2=char(uint8(code(2:2)));
                   val3=char(uint8(code(3:3)));
                   newstr(length(newstr)+1)=val1;
                   newstr(length(newstr)+1)=val2;
                   newstr(length(newstr)+1)=val3;
                   newsize=newsize+1;
                   newsize=newsize+1;
               else
                   
               end
           end
          
           newstr=(strjoin(newstr));
           newstr= regexprep(newstr, '\s+', '');
           TransformToUnicodeCharRet={newstr,newsize};
       end
       function charToCodePointReturn=charToCodePoint(obj,str)        
           fid = fopen('ny.txt','wt');
           fprintf(fid, str);
           fclose(fid);
           fID2 = fopen('ny.txt', 'r', 'n', 'UTF-8'); 
           bytes = fread(fID2);
           fclose(fID2);
           
           class(bytes);
           length(bytes);
           code = typecast(uint8(bytes), 'uint8');
           class(code);
           if code(1:1) < 128
               charToCodePointReturn=code;
           elseif code(1:1)< 224
               charToCodePointReturn=(uint32((code(1:1)) -192)*64)+(uint32(code(2:2))-128);
           elseif code(1:1)< 240
               charToCodePointReturn=(uint32((code(1:1)) -224)*4096)+((uint32(code(2:2))-128)*64)+ (uint32(code(3:3))-128);
           else
               charToCodePointReturn=(uint32((code(1:1)) -240)*262144)+((uint32(code(2:2))-128)*4096)+((uint32(code(3:3))-128)*64)+ (uint32(code(4:4))-128);
           end
       end
       function codePointToCharReturn=codePointToChar(obj,code)
           if (code <= 127) 
            codePointToCharReturn= char(code);
           elseif (code <= 2047)
               
               f1=fix(double(bitsra(code, 6))) + 192;
               f2=bitand(code , 63) + 128;
               codePointToCharReturn=char(native2unicode(uint8([f1 f2])));
           elseif (code <= 4095) 
               first=fix(double(bitsra(code, 12))) + 224;
               second=bitand(fix(bitsra(code, 6)) , 63) + 128;
               third=fix(bitand(code , 63)) + 128;
               codePointToCharReturn=char(native2unicode(uint8([first second third])));
           else 
               first=char((bitshift(code, 18)) + 240);
               second=char(bitand(fix(double(bitsra(code, 12))) , 63) + 128);
               third=char(bitand(fix(double(bitsra(code, 6))) , 63) + 128);
               fourth=char(bitand(code , 63) + 128);
               first(length(first)+1)=second; 
               first(length(first)+1)=third; 
               first(length(first)+1)=fourth; 
               codePointToCharReturn=  char(native2unicode(uint8([first second second third fourth])));
           end
       end
       function CalculateThresholdReturn=calculateThreshold(obj,k, bias)
           if (k <= bias + obj.TMIN)
               obj.TMIN;
                CalculateThresholdReturn=obj.TMIN;
                return; 
           elseif (k >= bias + obj.TMAX)
                obj.TMAX;
                CalculateThresholdReturn=obj.TMAX;
                return; 
           end
            k;
            bias;
            CalculateThresholdReturn=k - bias;
       end
       function AdaptReturn=Adapt(obj,delta1, numPoints, firstTime)
           delta1;
           numPoints;
           firstTime;
           if(firstTime)
               delta1= uint32(delta1 / obj.DAMP);
           else
               delta1= uint32(delta1 / 2);
           end
           delta1;
           delta1 = delta1 + typecast((delta1 / numPoints),'uint32');
           delta1; 
           k = 0;
           while delta1 > ((obj.BASE - obj.TMIN) * obj.TMAX) / 2
               delta1 = typecast((delta1 / (obj.BASE - obj.TMIN)),'uint32');
               k = k + obj.BASE;
           end
           %disp('ADAPT: delta, tmpk after whilw ');
           delta1;
           sum1=((obj.BASE - obj.TMIN + 1) * delta1);
           sum2=(delta1 + obj.SKEW );
           tmpk= fix(double(sum1) / double(sum2));
           k = k + tmpk;
           AdaptReturn=k;
           
       end
       
    end
end