function maximumMeanCrossingInterval=calculateMaximumMeanCrossingInterval(windowData_XYZ,mean_XYZ)
%calculateMaximumMeanCrossingInterval calculates the maximum mean Crossing
%Intervals 
% calculateMaximumMeanCrossingInterval(windowData_XYZ,mean_XYZ) Takes Input
% as windowData and mean of that window along X Y and Z axis
[row, ~]=size(windowData_XYZ);
% maximumMeanCrossingInterval=zeros(1,3);
Counter=zeros(row,3);
tempNum=ones(1,3);
for i=1:row
   if mean_XYZ(1) < windowData_XYZ(i,1)
       Counter(tempNum(1),1)=Counter(tempNum(1),1)+1;
   else
       tempNum(1)=tempNum(1)+1;
   end
   if mean_XYZ(2) < windowData_XYZ(i,2)
       Counter(tempNum(2),2)=Counter(tempNum(2),2)+1;
   else
       tempNum(2)=tempNum(2)+1;
   end
   if mean_XYZ(3) < windowData_XYZ(i,3)
       Counter(tempNum(3),3)=Counter(tempNum(3),3)+1;
   else
       tempNum(3)=tempNum(3)+1;
   end
end
maximumMeanCrossingInterval=max(Counter);
end