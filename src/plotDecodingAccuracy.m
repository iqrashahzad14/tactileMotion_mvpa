accu = [0.41	0.75
        0.5     0.5
        0.41	0.41
        0.41	0.75
        0.66	0.58];
figure
bar(accu)
hold on 
yline(0.5, '--')
xlabel('ROI') 
ylabel('Decoding Accuracy')
ylim([0 1])
set(gca,'xticklabel',{'visLV5','visRV5','tacLS1', 'tacLV5', 'tacRV5'});
title('Within Modality', 'Sub-001, Features = 90, smoothing = 2, b-maps')
legend({'vis-VerVsHor','tac-VerVsHor'},'Location','northeast')
saveas(gcf,'Sub-001_withinModality_features90_smoothin2_bmaps.png')
%%
accu = [0.33	0.25
        0.58	0.50
        0.33	0.41
        0.33	0.25
        0.41	0.58];
figure
bar(accu)
hold on 
yline(0.5, '--')
xlabel('ROI') 
ylabel('Decoding Accuracy')
ylim([0 1])
set(gca,'xticklabel',{'visLV5','visRV5','tacLS1', 'tacLV5', 'tacRV5'});
title('Within Modality', 'Sub-002, Features = 90, Smoothing = 2, b-maps')
legend({'vis-VerVsHor','tac-VerVsHor'},'Location','northeast')
saveas(gcf,'Sub-002_withinModality_features90_smoothin2_bmaps.png')
%%
accu = [0.66	0.66
        0.66	0.50
        0.41	0.50
        0.41	0.66
        0.75	0.58];
figure
bar(accu)
hold on 
yline(0.5, '--')
xlabel('ROI') 
ylabel('Decoding Accuracy')
ylim([0 1])
set(gca,'xticklabel',{'visLV5','visRV5','tacLS1', 'tacLV5', 'tacRV5'});
title('Within Modality', 'Sub-001, Features = 90, Smoothing = 2, t-maps')
legend({'vis-VerVsHor','tac-VerVsHor'},'Location','northeast')
saveas(gcf,'Sub-001_withinModality_features196_smoothin2_tmaps.png')

%%
accu = [0.33	0.25
        0.58	0.58
        0.25	0.50
        0.33	0.25
        0.41	0.50];
figure
bar(accu)
hold on 
yline(0.5, '--')
xlabel('ROI') 
ylabel('Decoding Accuracy')
ylim([0 1])
set(gca,'xticklabel',{'visLV5','visRV5','tacLS1', 'tacLV5', 'tacRV5'});
title('Within Modality', 'Sub-002, Features = 90, Smoothing = 2, t-maps')
legend({'vis-VerVsHor','tac-VerVsHor'},'Location','northeast')
saveas(gcf,'Sub-002_withinModality_features90_smoothin2_tmaps.png')
