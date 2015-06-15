%%Clear all Previous data
clear; clc;
%% Load Dataset
% load('Marker.mat');
load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\Automotive\AccData.mat');
% load('C:\Users\Dell\Documents\MATLAB\PD_Dataset\BikeData\AccData.mat');
fulldata=AccData;
[samples, ~]=size(AccData);
%% Initializing Variables 
%  standard_XYZ - stores standard deviation along (X/Y/Z) axis.
%  mean_XYZ - Stores mean along (X/Y/Z) axis.

mean_Data=zeros(floor(samples/50),3);

counter=1;

%% Calculating Mean and Standard deviation
for i=1:samples-50
     mean_Data(i,:)=mean(fulldata(i:(i+49),2:end));
end

clear i counter samples;