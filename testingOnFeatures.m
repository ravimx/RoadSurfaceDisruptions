%%Creating Different Clusters
cluX=kmeans(standard_XYZ(:,1),3);
cluY=kmeans(standard_XYZ(:,2),3);
cluZ=kmeans(standard_XYZ(:,3),3);
% Cluster_XYZ=[cluX, cluY,cluZ];
%% Seprating Cluster Points for Z axis
clusterNumber1=find(cluZ==1);
clusterNumber2=find(cluZ==2);
clusterNumber3=find(cluZ==3);
%% To find the Top cluster points
% On each itration different clusters denotes different points so To find
% the topmost cluster. Clusters are formed according to their SD values so
% Top cluster will have higher values, finding top cluster using avarage
avrage1=mean(standard_XYZ(clusterNumber1,3));
avrage2=mean(standard_XYZ(clusterNumber2,3));
avrage3=mean(standard_XYZ(clusterNumber3,3));

[~, index]=max([avrage1,avrage2,avrage3]);

switch index
    case 1
        topCluster=clusterNumber1;
    case 2
        topCluster=clusterNumber2;
    case 3
        topCluster=clusterNumber3;    
end

clear cluX cluY cluZ clusterNumber1 clusterNumber2 clusterNumber3 avrage1 avrage2 avrage3
%% Testing with different Approchase
% Here, points having ratio greater than 2 are taken out
% these points are Intersect with topCluster
% % % % % % % % % % % % % % % % % % % % % % % % 
% ratioSD=find(ratioOfStandardDeviations(:,3)>2);
% filteredData1=intersect(topCluster,ratioSD);
% 
% meancrossInter=find(numberofMeanCrossing(:,3)>30);
% maxmeanCrossing=find(maximumMeanCrossingInterval(:,3)>30);
% filteredData2=intersect(meancrossInter,maxmeanCrossing);
% 
% filterData=intersect(filteredData1,filteredData2);

% filterPoints=find(clusterNumber==ratioSD);
% % % % % % % % % % % % % % % % % % % % % % % % % 
%% Filtering The data
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                This is to Check all Condition                 %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

[sampleSize,~]=size(standard_XYZ(topCluster,:));
filterId=zeros(sampleSize,1);
count=1;
for i=1:sampleSize
    if maximumMeanCrossingInterval(i,3)>30
        if numberofMeanCrossing(i,3)>30
            if ratioOfStandardDeviations(i,3) >1
                filterId(count)=topCluster(i);
                count=count+1;
            end
        end
    end
end


%% Filtering Data using Specific Condition
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%            This is to Check Only specific Condition           %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
[sampleSize,~]=size(standard_XYZ(topCluster,:));
filterId=zeros(sampleSize,1);
count=1;
rSD=zeros(sampleSize,1);
nMC=zeros(sampleSize,1);
mMC=zeros(sampleSize,1);
for i=1:sampleSize
    if maximumMeanCrossingInterval(i,3)>30
        mMC(i)=1;
    end
    if numberofMeanCrossing(i,3)>30
        nMC(i)=1;       
    end
    if ratioOfStandardDeviations(i,3) >1.5
        rSD(i)=1;
    end
end
featu=[mMC, nMC, rSD];

%% Peak find Method
% Hear I am using the peak find method, I am finding the total number of
% peaks in the Standard Deviation. Because SD is the devitaion from from
% mean more deviated value might give the possibility of Pothole
[values, index]=findpeaks(standard_XYZ(topCluster,end));
scatter(topCluster(index,1),standard_XYZ(topCluster(index,1),end));

%% Final Plotting of Data
plot(mean_XYZ);
hold on;
% scatter(clusterNumber1,standard_XYZ(clusterNumber1,3));
scatter(filterId(find(filterId)),mean_XYZ(filterId(find(filterId)),3));
% scatter(clusterNumber3,standard_XYZ(clusterNumber3,3));
hold off;


%% Plots in Orignal Data
MeanIndex=topCluster(index,1);
OrignalIndex=50*MeanIndex;
getFullOrignalIndex=getIndex(OrignalIndex,50);
plot(fulldata(:,2:end));
hold on;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Testing For Blocks
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
[row, ~]=size(OrignalIndex);
samplingRate=50;
% tempIndex=zeros(50,1);
fullOrignalIndex=zeros(samplingRate,1);
% count=1;
for i=1:row
    if(OrignalIndex(i) > samplingRate)
        fullOrignalIndex(samplingRate)=OrignalIndex(i);
        for j=(samplingRate-1):-1:1
            fullOrignalIndex(j)=fullOrignalIndex(j+1)-1;
        end
        %     fullOrignalIndex(count*i)=tempIndex;
        plot(fullOrignalIndex,fulldata(fullOrignalIndex,2:end),'Color','k');
    end
end
% fullOrignalIndex1=fullOrignalIndex(find(fullOrignalIndex(:)));
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% plot(getFullOrignalIndex,fulldata(getFullOrignalIndex,2:end),'Color','k');
hold off;




