function [res_letter, k_neighbours, dist_matrix] = find_knn_dtw(dataset,label,new_example,k, i_ex, dist_matrix)
% find_knn_dtw Compute k-nearest-neighbours function using DTW distance instead
% of euclidean distance, calculating dtw after doing the norms of vectors
% on (x,y,z).
%
% INPUTS dataset : data base carrying the reference data. Each line holds 
%        the 46 acc signals for a letter. size(dataset) = [nLetter nAccel*reccordTime nAxis]
%        label : corresponding tab giving the letter label (char) to each line of dataSet. size(label) = [nLetter]
%        newSignal : signal processed to be compared with dataSet elements
%        k : number of neighbours to be found to compute knn method
%
% OUTPUTS resLetter = letter which occurence was the highest in the k neighbours found
%         k_neighbours = labels of the k neighbours found
%         dist_matrix : distance between example and elements from dataset to know how differents are the signals
%
% Author: Ines Lacote
% GIT : https://github.com/InesLac/AccSignalComparison
% email: ines.lacote@protonmail.com
% July 2020; Last revision: 19-Nov-2004


tabRes = zeros(k,2); 
tabRes(:,1) = inf+tabRes(:,1);
% tabRes will store the k min distances btw signals from dataSet and 
% newSignal (1st column) and their index in dataSet (2nd) 

nLetter = size(dist_matrix,1);
nAcc = size(dataset,2);
for iLetter = 1 : nLetter
    if i_ex <= iLetter
        distTot = 0 ;
        for iAcc = 1 : nAcc
            signalD = sqrt(dataset{iLetter, iAcc, 1}.*dataset{iLetter, iAcc, 1} + ...
                            dataset{iLetter, iAcc, 2}.*dataset{iLetter, iAcc, 2}+ ...
                            dataset{iLetter, iAcc, 3}.*dataset{iLetter, iAcc, 3});
            signalEx = sqrt(new_example(:,iAcc,1).*new_example(:,iAcc,1) + ...
                            new_example(:,iAcc,2).*new_example(:,iAcc,2)+ ...
                            new_example(:,iAcc,3).*new_example(:,iAcc,3));
            %signalDist = (dtw(dataSet{iLetter, iAcc, 1},newSignal(:,iAcc,1)) + ...  % x axis
                      %dtw(dataSet{iLetter, iAcc, 2},newSignal(:,iAcc,2)) + ...  % y axis
                      %dtw(dataSet{iLetter, iAcc, 3},newSignal(:,iAcc,3)))  ...  % z axis
                      %/3; % computes dtw on each 3 axis and gives the mean
            signalDist = dtw(signalD,signalEx);
            distTot = distTot + signalDist;
        end
        distTot = distTot/nAcc;
        if distTot < tabRes(k,1)
            tabRes(k,1)= distTot; % add dist to the tab of min distances if smaller than the dist already added
            tabRes(k,2)=iLetter;
            tabRes = sortrows(tabRes); % organize in < order
        end
        dist_matrix(i_ex, iLetter) = distTot;
        dist_matrix(iLetter, i_ex) = distTot;  
    else
        distTot = dist_matrix(i_ex, iLetter);
        if distTot < tabRes(k,1)
            tabRes(k,1)= distTot; % add dist to the tab of min distances if smaller than the dist already added
            tabRes(k,2)=iLetter;
            tabRes = sortrows(tabRes); % organize in < order
        end
    end
    
end
k_neighbours = label(tabRes(:, 2)); % corresponding letters in dataSet
[occurence, letter] = groupcounts(k_neighbours); % nb of occurence (in > order) for each letter in kNeighbours 
indOccMax = find(occurence == max(occurence));
if length(indOccMax) == 1
    res_letter = letter(indOccMax);
else
    res_letter = letter(indOccMax);
end
end



