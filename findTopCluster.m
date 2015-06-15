function topCluster=findTopCluster(clusterNumber1Values,clusterNumber2Values,clusterNumber3Values,axisNumber)

avrage1=mean(tempData1);
avrage2=mean(tempData2);
avrage3=mean(tempData3);

[~, index]=max([avrage1,avrage2,avrage3]);

switch index
    case 1
        topCluster=clusterNumber1;
    case 2
        topCluster=clusterNumber2;
    case 3
        topCluster=clusterNumber3;    
end
end