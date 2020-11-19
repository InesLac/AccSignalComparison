function [] = visualize_knn_results(resLabel,distMatrix, class)

% Author: Camilo Sarmiento
% November 2019; 
% Adaptation July 2020; last revision by Ines Lacote : 19-Nov-2004

%% Set up/organisation of data
%label_attendus = cell2mat(resLabel(:,2)); %when using only
label_attendus = convertCharsToStrings(resLabel(:,2)); %when using "rest"
label_obtenus = label_attendus;
for ind = 1:length(resLabel)
    val_inter = convertCharsToStrings(resLabel{ind,1});
    if length(val_inter) > 1
        label_obtenus(ind) = val_inter(1);
    else
        label_obtenus(ind) = val_inter;
    end
end

% Obtenir class sous forme numerique
for ind = 1:length(label_obtenus)
    label_obtenus_num(ind) = find(class == label_obtenus(ind));
end

for ind = 1:length(label_obtenus)
    label_attendus_num(ind) = find(class == label_attendus(ind));
end

% Confusion performence calculus
% Construction de la matrice de confusion
C = confusionmat(label_attendus_num, label_obtenus_num);
% Calcul performances
bonne_classif = trace(C)/sum(C(:));

%% Confusion Matrix
% Initialisation matrices contenant donnÃ©es class
targets = zeros(length(class), length(label_attendus_num));
outputs = zeros(length(class), length(label_obtenus_num));

% On identifie les diffÃ©rentes correspondances
targetsIdx = sub2ind(size(targets), label_attendus_num, 1:length(label_attendus_num));
outputsIdx = sub2ind(size(outputs), label_obtenus_num, 1:length(label_attendus_num));

% On met Ã  1 les valeurs correspondantes
targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;

% Affichage matrice de confusion
figure
plotconfusion(outputs, targets)
set(gca,'XAxisLocation','top','YAxisLocation','left');
h = gca;
h.YLabel.String = 'Label réel';
h.XLabel.String = 'Label attribué';
title('');
h.XTickLabelRotation = 0;
switch length(class)
    case 2
        h.XTickLabel = {class(1), class(2),''};
        h.YTickLabel = {class(1), class(2),''};
    case 3
        h.XTickLabel = {class(1), class(2), class(3),''};
        h.YTickLabel = {class(1), class(2), class(3),''};
    case 9
        h.XTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9),''};
        h.YTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9),''};
    case 10
        h.XTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9), class(10),''};
        h.YTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9), class(10),''};
end

%% Affichage confusion couleur
%Affiche confusion couleur
figure
imagesc(mat2gray(C))
set(gca,'XAxisLocation','top','YAxisLocation','left');
h = gca;
h.YLabel.String = 'Label réel';
h.XLabel.String = 'Label attribué';
title('');
colorbar
h.XTickLabelRotation = 0;
switch length(class)
    case 2
        h.XTickLabel = {class(1), class(2),''};
        h.YTickLabel = {class(1), class(2),''};
    case 3
        h.XTickLabel = {class(1), class(2), class(3),''};
        h.YTickLabel = {class(1), class(2), class(3),''};
    case 6
        h.XTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6),''};
        h.YTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6),''};
    case 9
        h.XTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9),''};
        h.YTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9),''};
    case 10
        h.XTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9), class(10),''};
        h.YTickLabel = {class(1), class(2), class(3), class(4), class(5), class(6), class(7), class(8), class(9), class(10),''};
end

%% Affichage matrice distances
figure
imagesc(mat2gray(distMatrix));
set(gca,'XAxisLocation','top','YAxisLocation','left');
colorbar
end

