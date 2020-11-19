function [res_label,res_k_neighbour,dist_matrix] = classify_knn(dataset,label, new_example,k,res_label,res_k_neighbour,dist_matrix, nb_test)
% classify_knn use knn classification principle to give the most probable 
% result of classification (call find_knn_dtw function).
% INPUTS dataset : existing tab of cells dataset with letter examples 
%        (nb examples x 42 acc x 3 axes). Each cell contains a temporal
%        signal.
%        label : tab with labels corresponding for each dataset line
%        new_example : reccording to be classify compared to dataset
%        k : k nearest neighbours to be found
%        file : new example to add to dataset
%        letter : label corresponding to the letter recorded in file
%        nb_acc : number of accelerometers. Will give the number of columns
%        in dataset
%        res_label,res_k_neighbour,dist_matrix : initiated but empty, to
%        give output
%        nb_test : number of comparison operated to classifiy
%
% OUTPUTS res_label : given result as label corresponding to "new_example"
%         res_k_neighbour : labels of the k neighbours found
%         dist_matrix : distance between example and elements from dataset
%         to know how differents are the signals
%
% Author: Ines Lacote
% GIT : https://github.com/InesLac/AccSignalComparison
% email: ines.lacote@protonmail.com
% July 2020; Last revision: 19-Nov-2004

for i_ex = 1:nb_test
%     clear example ;
     disp(i_ex)
%     for i_acc = 1:size(dataset2,2) %uncomment and add dataset2 in inputs if you want to test all the example of dataset2 compared to the reference dataset.
%         for i_ax = 1:size(dataset2,3)
%             new_example(:,i_acc,i_ax) = dataset2{i_ex,i_acc,i_ax};
%         end
%     end
    [resLetter, kNeighbours, dist_matrix] = find_knn_dtw(dataset,label,new_example,k, i_ex, dist_matrix);
    res_label{i_ex,1} = resLetter;
    res_label{i_ex,2} = label{i_ex,1};
    res_k_neighbour{i_ex,1} = kNeighbours;
end

end

