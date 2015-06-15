function plotSampleData(stan)
    plot(stan);
    legend('X axis','Y axis','Z axis','Location','NW');
    title('2-D line Plot of delta');
    xlabel('Time Window');
    ylabel('delta');
end