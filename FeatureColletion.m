%%Clear all Previous data
clear; clc;
%% Load Dataset
% load('Marker.mat');
% load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\Automotive\AccData.mat');
% load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\BikeData\AccData.mat');
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%  Loading 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\Automotive\AccData.mat');
% fulldata=AccData;
% [samples, ~]=size(AccData);

%% Marker DataSet
% load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\accelerometer-1\trace3\Marker.mat');
% [samples, ~]=size(fulldata);

%% Self Testing Bike DataSet
% load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\BikeData\AccData.mat');
 load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\BikeData\college!00footDataHighPass.mat');
 fulldata=College100Foot;
% fulldata=ravifata;
[samples, ~]=size(fulldata);
%% Initializing Variables 
%  standard_XYZ - stores standard deviation along (X/Y/Z) axis.
%  mean_XYZ - Stores mean along (X/Y/Z) axis.
standard_XYZ=zeros(floor(samples/50),3);
mean_XYZ=zeros(floor(samples/50),3);
delta_XYZ=zeros(floor(samples/50),3);
numberofMeanCrossing=zeros(floor(samples/50),3);
maximumMeanCrossingInterval=zeros(floor(samples/50),3);
ratioOfStandardDeviations=zeros(floor(samples/50),3);
counter=1;

%% Calculating Mean and Standard deviation
for i=1:50:samples-50
      mean_XYZ(counter,:)=mean(fulldata(i:i+49,2:4));
      standard_XYZ(counter,:)=std(fulldata(i:i+49,2:4));
      delta_XYZ(counter,:)=max(fulldata(i:i+49,2:4))-min(fulldata(i:i+49,2:4));

%     Calculating extra features
      numberofMeanCrossing(counter,:)=calculateNumberofMeanCrossing(fulldata(i:i+49,2:4),mean_XYZ(counter,:));
      maximumMeanCrossingInterval(counter,:)=calculateMaximumMeanCrossingInterval(fulldata(i:i+49,2:4),mean_XYZ(counter,:));
      if i > 1
        ratioOfStandardDeviations(counter,:)=calculateRatioOfStandardDeviations(standard_XYZ(counter,:),standard_XYZ(counter-1,:));
      end      
      counter=counter+1;
end

clear i counter samples;