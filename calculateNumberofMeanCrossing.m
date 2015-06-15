function NumberofMeanCrossing=calculateNumberofMeanCrossing(windowData_XYZ,mean_XYZ)
%calculateNumberofMeanCrossing Calculates the Total Number of Mean Crossing
% Intervals
%  calculateNumberofMeanCrossing(windowData_XYZ,mean_XYZ) takes the Input
%  as Window Data along X, Y and Z axis and mean of that window along respective axis;
[row, ~]=size(windowData_XYZ);
NumberofMeanCrossing=zeros(1,3);

for i=1:row
   if mean_XYZ(1) < windowData_XYZ(i,1)
       NumberofMeanCrossing(1)=NumberofMeanCrossing(1)+1;
   end
   if mean_XYZ(2) < windowData_XYZ(i,2)
       NumberofMeanCrossing(2)=NumberofMeanCrossing(2)+1;
   end
   if mean_XYZ(3) < windowData_XYZ(i,3)
       NumberofMeanCrossing(3)=NumberofMeanCrossing(3)+1;
   end
end

end