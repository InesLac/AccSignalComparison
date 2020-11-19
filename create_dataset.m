function [dataset, label] = create_dataset(dataset,label,file,letter,nb_acc)
% create_dataset add new letter example known as "file" to the preexistinig dataset 
% INPUTS dataset : existing or empty dataset with letter example
%        label : tab with labels corresponding for each dataset line
%        file : new example to add to dataset
%        letter : label corresponding to the letter recorded in file
%        nb_acc : number of accelerometers. Will give the number of columns
%        in dataset
%
% OUTPUTS dataset : tab of cells (nb of example x 42 acc x 3 axis) each
%                   cell holds a time recording of the accelerometer and
%                   axis concerned for each the example.
%         label : tab of cell (nb of example x 1)
%
% Author: Ines Lacote
% GIT : https://github.com/InesLac/AccSignalComparison
% email: ines.lacote@protonmail.com
% July 2020; Last revision: 19-Nov-2004

line = size(dataset,1)+1;
for iAcc = 1:nb_acc
    dataset{line, iAcc,1} = file(:,iAcc,1);
    dataset{line, iAcc,2} = file(:,iAcc,2);
    dataset{line, iAcc,3} = file(:,iAcc,3);
end
label{line,1}= letter;
end

