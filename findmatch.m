 function finalClu = findmatch(cluX,cluY,cluZ)
[samples col]=size(cluX);
finalClu=zeros(samples,1);
count=1;
for i=1:samples
    if(cluY(i) == 1 && cluZ(i) == 1 && cluX(i) == 1)
        finalClu(count)=1;
        count=count+1;    
    else
        count=count+1;    
    end
end
end