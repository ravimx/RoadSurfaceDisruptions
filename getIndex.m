function fullOrignalIndex1=getIndex(meIndex, samplingRate)
[row, ~]=size(meIndex);
% tempIndex=zeros(50,1);
fullOrignalIndex=zeros(row*samplingRate,1);
% count=1;
for i=1:row
    if(meIndex(i) > samplingRate)
        fullOrignalIndex(samplingRate*i)=meIndex(i);
        for j=(samplingRate*i-1):-1:(samplingRate*i-samplingRate+1)
            fullOrignalIndex(j)=fullOrignalIndex(j+1)-1;
        end
        %     fullOrignalIndex(count*i)=tempIndex;
    end
end
fullOrignalIndex1=fullOrignalIndex(find(fullOrignalIndex(:)));
end