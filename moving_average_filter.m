function [data_acc_MA] = moving_average_filter(data_acc,nb_acc,nb_axis, nb_point)
% moving_average_filter applies moving average filter on reccorded acc
% signals. Return filtered signals organized the same as before signal
% processing.
%
% INPUTS data_acc : signal to be filtered (time of recc x 42 acc x 3 axis)
%        nb_acc : number of accellerometers
%        nb_axis : number of axis
%        nb_point : number of points for the filter window
%
% OUTPUTS data_acc_MA : tab/matrix (time of recc x 42 acc x 3 axis)
%         containing data_acc data FILTERED.
%
% Author: Ines Lacote
% GIT : https://github.com/InesLac/AccSignalComparison
% email: ines.lacote@protonmail.com
% July 2020; Last revision: 19-Nov-2004

windowFilter = ones(nb_point,1)/nb_point ; % Generate the desired window
data_acc_MA = zeros(size(data_acc,1),nb_acc,nb_axis);
for m = 1:nb_acc
    for n = 1:nb_axis
    data_acc_MA(:,m,n) = filter(windowFilter, 1, data_acc(:,m,n)); %Apply moving average filtering   
    end
end
end

