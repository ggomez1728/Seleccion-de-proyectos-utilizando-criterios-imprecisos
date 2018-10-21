
function [MDA] = ConjuntarValoracionDeCriteriosDifusos(numberOfProjects, numberOfCriteria, numberOfDecisors, MD)
    for i = 1: numberOfProjects
         for j = 1: numberOfCriteria
             % Inicializar arreglos temporales
             aTmp1 = []; aTmp2 = []; aTmp3 = [];
             for k = 1: numberOfDecisors
                 aTmp1 = [aTmp1 MD{k}{i,j}(1)];
                 aTmp2 = [aTmp2 MD{k}{i,j}(2)];
                 aTmp3 = [aTmp3 MD{k}{i,j}(3)];
             end
             valorAgregadoa1(j) = (1/numberOfDecisors)* sum(aTmp1);
             valorAgregadoa2(j) = (1/numberOfDecisors)* sum(aTmp2);
             valorAgregadoa3(j) = (1/numberOfDecisors)* sum(aTmp3);
         end
         MDA(:,:,i) = [valorAgregadoa1; valorAgregadoa2;
        valorAgregadoa3];
    end
end