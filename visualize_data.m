function [] = visualize_data(data_acc,nb_acc, ind_acc,label_axis,t)
% visualize_data permits to visualize all 42 temporal signals (1 per accel)
% 1 window is open for each axis (x, y, z)
%
% INPUTS data_acc : signal to be visualized (time of recc x 42 acc x 3 axis)
%        nb_acc : number of accellerometers
%        ind_acc : from 1 to 46 (42 acc missing 10,20,30,40)
%
% OUTPUT (void) open figure windows
%
% Author: Yitian Shao
% Git link : https://github.com/maxwellre/AccIII/tree/master/Debug
% Date : 2017

for ax = 1:length(label_axis) % 1:X-axis, 2:Y-axis, 3:Z-axis
    figure('Position', get(0,'ScreenSize').*[10 50 0.95 0.8],...
            'Name',sprintf('%s-axis',label_axis{ax}))
    for k = 1:nb_acc
        subplot(14,3,k)
        plot(t, data_acc(:,k,ax), 'LineWidth', 0.5);
        ylabel(sprintf('%d',ind_acc(k)));
        %xlim([t(1) t(end)])
        %ylim([-0.8 0.8])
        box off
        if k<42
            xticks([])
        end
    end
    xlabel('Temps (Secs)')
end

