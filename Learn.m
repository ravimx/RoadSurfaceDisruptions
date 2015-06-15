%%Clear all Previous data
clear; clc;
%% Load Dataset
load('Marker.mat');
%%
[samples, datas]=size(fulldata);
%% Initializing Variables 
%  standard_XYZ - stores standard deviation along (X/Y/Z) axis.
%  mean_XYZ - Stores mean along (X/Y/Z) axis.
standard_XYZ=zeros(floor(samples/50),3);
mean_XYZ=zeros(floor(samples/50),3);
delta_XYZ=zeros(floor(samples/50),3);
counter=1;

%% Calculating Mean and Standard deviation
for i=1:50:samples-50
      mean_XYZ(counter,:)=mean(fulldata(i:i+49,2:4));
      standard_XYZ(counter,:)=std(fulldata(i:i+49,2:4));
      delta_XYZ(counter,:)=max(fulldata(i:i+49,2:4))-min(fulldata(i:i+49,2:4));
      counter=counter+1;    
end
%% Performing K-Means Clustering
% Two clusters are formed along X, Y and Z axis
cluX=kmeans(standard_XYZ(:,1),3);
cluY=kmeans(standard_XYZ(:,2),3);
cluZ=kmeans(standard_XYZ(:,3),3);
%% Rotation Matrix Data collection
bikedata1=fulldata;
[row col]=size(bikedata1); 
matMatrix=zeros(row,4);
i=2;
sy=2;
fy=3;
th=4;
%% Cnverting values from Smartphones axis to the vehicle's axis.
% matMatrix will store the data in vehical's frame of refrance. Rth, Rfy,
% Rsy are the values of R Theta, R phy, R sy. Together it gives rotation
% along X, Y, Z axis.
for i=2:row
    Rth=[cos(bikedata1(i,th)) sin(bikedata1(i,th)) 0 0; -sin(bikedata1(i,th)) cos(bikedata1(i,th)) 0 0; 0 0 1 0; 0 0 0 1;];
    Rfy=[cos(bikedata1(i,fy)) 0 -sin(bikedata1(i,fy)) 0; 0 1 0 0; sin(bikedata1(i,fy)) 0 cos(bikedata1(i,fy)) 0; 0 0 0 1];
    Rsy=[1 0 0 0; 0 cos(bikedata1(i,sy)) sin(bikedata1(i,sy)) 0; 0 -sin(bikedata1(i,sy)) cos(bikedata1(i,sy)) 0; 0 0 0 1];
    V=ones(4,1);
    matMatrix(i-1,:)= Rth * Rsy * Rfy * V ;
%     Rth * Rsy * Rfy * V
end

%% Plotting all Matrixes
% figure;plot(fulldata(:,2:4));
% hold on
% figure;plot(mean_XYZ,'r.','MarkerSize',5);
% figure;plot(standard_XYZ,'b.','MarkerSize',5);
% legend('cluster1','cluster2','Centroids','Location','NW');
% % figure;plot(mean_XYZ,'r.','MarkerSize',5);
% hold off
plot(mean_XYZ,'r.','MarkerSize',5);
hold on
plot(standard_XYZ,'b.','MarkerSize',5);
legend('cluster1','cluster2','Centroids','Location','NW');
% figure;plot(mean_XYZ,'r.','MarkerSize',5);
hold off
%% Plotting Cluster Data
% 
% figure;plot(cluX,'b.','MarkerSize',5);
% figure;plot(cluY,'b.','MarkerSize',5);
% figure;plot(cluZ,'b.','MarkerSize',5);


%% Seprating the clustered data

finalmatch=findmatch(cluX,cluY,cluZ);
plotData(standard_XYZ,finalmatch);
