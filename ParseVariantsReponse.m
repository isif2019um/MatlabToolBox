function ParseVariantsReponse(Variants)
if isfield(Variants,'variants')
    for i=1:length(Variants)
        if isfield(Variants,'relation')
            disp('relation:');
            %disp(Variants.relation);
            for j=1:length(Variants.relation)
                disp(Variants.relation(j));
            end
        end
        if isfield(Variants,'idnTable')
            disp('idnTable:');
            disp(Variants.idnTable);
        end
        if isfield(Variants,'variantNames')
            disp('variantNames:');
            %disp(Variants.variantNames);
            for j=1:length(Variants.variantNames)
                %disp(Variants.relation(j));
                if isfield(Variants.variantNames(j),'ldhName')
                    disp(Variants.variantNames(j).ldhName);
                end
                if isfield(Variants.variantNames(j),'unicodeName')
                    disp(Variants.variantNames(j).unicodeName);
                end
            end
        end
        
    end
end
end