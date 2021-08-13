function ParseVcardArrayResponse(VcardArray)
    for n=1:numel(VcardArray)
        if(n==2)
            Tmp=VcardArray(n);
            TmpArr=Tmp{1};
            %length(Tmp{1})
            for p=1:numel(TmpArr)
                disp('Index');
                disp('[');
                disp(p);
                disp(']:');
                Tmp2=TmpArr{p};
                for q=1:numel(Tmp2)
                    %disp(class(Tmp2{q}))    
                    if(string(class(Tmp2{q}))=="cell")
                        SumTmp=Tmp2{q};
                        for i=1:length(SumTmp)
                            disp(SumTmp(i));
                        end
                    elseif(string(class(Tmp2{q}))=="struct")
                        SumTmp=Tmp2{q};
                        for i=1:length(SumTmp)
                            disp(SumTmp(i));
                        end
                    else
                        disp(Tmp2{q});
                    end
                end
            end
        else
            disp('Index');
            disp(n);
            disp(VcardArray(n))
        end
    end
end