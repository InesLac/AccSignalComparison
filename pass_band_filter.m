function [data_acc_BP] = pass_band_filter(data_acc,nb_acc,nb_axis, fs, f_pass)
% pass_band_filter applies moving average filter on reccorded acc
% signals. Return filtered signals organized the same as before signal
% processing.
%
% INPUTS data_acc : signal to be filtered (time of recc x 42 acc x 3 axis)
%        nb_acc : number of accellerometers
%        nb_axis : number of axis
%        fs : sample frequency of signal recording
%        f_pass : low and high values of the band pass filter to apply
%
% OUTPUTS data_acc_BP : tab/matrix (time of recc x 42 acc x 3 axis)
%         containing data_acc data FILTERED.
%
% Author: Ines Lacote
% GIT : https://github.com/InesLac/AccSignalComparison
% email: ines.lacote@protonmail.com
% July 2020; Last revision: 19-Nov-2004

data_acc_BP = zeros(size(data_acc,1),nb_acc,nb_axis);
for m = 1:nb_acc
    for n = 1:nb_axis
    data_acc_BP(:,m,n) = bandpass(data_acc(:,m,n),f_pass,fs); %Apply moving average filtering   
    end
end
end

