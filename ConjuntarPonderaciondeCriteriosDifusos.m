function [MDNP] = conjuntarPonderacionDeCriteriosDifusos(pesoD,  MDA)

numberOfDecisors = numel(MDA(:, 1, 1));
numberOfCriteria = numel(MDA(1, :, 1));
numberOfProjects = numel(MDA(1, 1, :));

for i = 1:numberOfCriteria
     % Inicializar arreglos temporales
     aTmp1 = []; aTmp2 = []; aTmp3 = [];
     for j = 1: numberOfDecisors
         aTmp1 = [aTmp1 pesoD{j}{i}(1)];
         aTmp2 = [aTmp2 pesoD{j}{i}(2)];
         aTmp3 = [aTmp3 pesoD{j}{i}(3)];
     end
     pesoa1(i) = (1/numberOfDecisors)* sum(aTmp1);
     pesoa2(i) = (1/numberOfDecisors)* sum(aTmp2);
     pesoa3(i) = (1/numberOfDecisors)* sum(aTmp3);
end
pesos = [pesoa1; pesoa2; pesoa3];

% Obtener medidas unificadas, ponderadas y agregadas de
% los criterios difusos para cada idea
% - Normalizar la Matriz de Decision:
% No es necesario, ya que las escalas para todos los criterios
% están unificadas
% - Construir la matriz de decision normalizada y ponderada (MDNP):
% Inicializar MDNP, para i= 3 alternativas,j= 17 sub-criterios,
 
% parameros de la funcion de pertenencia de un numero borroso
% triangular.

MDNP = zeros(numberOfDecisors, numberOfCriteria, numberOfProjects);
for i = 1: numberOfDecisors
    for j = 1: numberOfCriteria
        for k = 1: numberOfProjects
           MDNP(i,j,k) = MDA(i,j,k)*pesos(i,j);
        end
    end
end

end