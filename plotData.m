function plotData(X, y)
% Create New Figure
figure; hold on;

positiveVlaues=find(y==1); negetiveValue=find(y==0);


% plot(X(positiveVlaues,1),X(positiveVlaues,2),'k+','LineWidth',2,'MarkerSize',7,X(positiveVlaues,1),X(positiveVlaues,3),'k+','LineWidth',2,'MarkerSize',7,X(positiveVlaues,1),X(positiveVlaues,4),'k+','LineWidth',2,'MarkerSize',7);
% plot(X(positiveVlaues,1),X(positiveVlaues,2),X(positiveVlaues,1),X(positiveVlaues,3),X(positiveVlaues,1),X(positiveVlaues,4),'k+','LineWidth',2,'MarkerSize',7);
plot(positiveVlaues,X(positiveVlaues,1),'k+','LineWidth',2,'MarkerSize',15);
plot(negetiveValue,X(negetiveValue,1),'ko','MarkerFaceColor','y','MarkerSize',7);
% plot(X(:,2),'ko','MarkerFaceColor','r','MarkerSize',7);
legend('Smooth','Bump');
title('2-D plot of Detected Surface Disruption');
xlabel('Time Window');
ylabel('Deviation from mean');

% plot(X(negetiveValue,1),X(negetiveValue,2),'ko','MarkerFaceColor','y','MarkerSize',7,X(negetiveValue,1),X(negetiveValue,3),'ko','MarkerFaceColor','y','MarkerSize',7,X(negetiveValue,1),X(negetiveValue,4),'ko','MarkerFaceColor','y','MarkerSize',7);
%  plot(X(negetiveValue,1),X(negetiveValue,2),X(negetiveValue,1),X(negetiveValue,3),X(negetiveValue,1),X(negetiveValue,4),'ko','MarkerFaceColor','y','MarkerSize',7);

% =========================================================================

% hold off;
hold off;

end
