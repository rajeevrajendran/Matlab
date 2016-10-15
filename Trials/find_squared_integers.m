

Int = [];
k=1;
for i=1:100000
    for j=1:100000
        if i < j
            c = (i^2+j^2)^0.5;
            p = (i^4 + j^4)^0.5;
            if rem(c,1) == 0 ;
                if rem(p,1) == 0 ;
                    
                    Int(k,1)= i;
                    Int(k,2)= j;
                    Int(k,3)= c;
                    Int(k,4)= p;
                    k=k+1;
                end
            end
        end
    end
end


