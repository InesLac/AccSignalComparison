function [data_acc] = new_extract_data(file, nb_acc, ind_acc, nb_axis,gscale,ind_x1,ind_y1,ind_z1)
% new_extract_data extract data from csv file to organize it in "data_acc" a tab
% (time of reccording (number of element in sample x 42 accelerometers x 3 axis). 
%
% INPUTS file : new reccording from the csv file studied here
%        nb_acc : number of accelerometers. Will give enable the
%        organization in acc_data
%        ind_acc : gives the value of the accellerometers/columns holding
%        signals (from 1 to 46 with 10,20,30,40 holding no signal)
%        nb_axis corresponding to x,y,z 
%        gscale : rescale values from accelerometers. (see Shao2019/Dinulescu 2020)
%        ind_x1,ind_y1, ind_z1 : gives the index of columns corresponding to x, y and z data in csv file 
%
% OUTPUTS data_acc : a 3D matrix/tab (time of reccording (number of elements
%         in sample) x 42 accelerometers x 3 axis). 
%
% Author: Ines Lacote
% GIT : https://github.com/InesLac/AccSignalComparison
% email: ines.lacote@protonmail.com
% July 2020; Last revision: 19-Nov-2004

data_acc = zeros(length(file),nb_acc, nb_axis);

for iacc = 1:nb_acc
    data_acc(:,iacc,1) = file(:, ind_x1(ind_acc(iacc)))*gscale;
    disp(ind_x1(ind_acc(iacc)));
    data_acc(:,iacc,2) = file(:, ind_y1(ind_acc(iacc)))*gscale;
    data_acc(:,iacc,3) = file(:, ind_z1(ind_acc(iacc)))*gscale;
end

