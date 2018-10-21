function [proyectosInvalidos] = discard_projects_less_than(lessThat, lessThatValues,lessThatPositions, proyectosInvalidos, MDA)
numberOfProjects = numel(MDA(1, 1, :));
if lessThat  == true
        for index = 1: numel(lessThatValues)
            for k = 1: numberOfProjects
                if (MDA(1,lessThatPositions(index),k) < lessThatValues{index}(1)) && ~(any( proyectosInvalidos(:) == k ))
                       proyectosInvalidos = [proyectosInvalidos k];
                end
            end
        end
    end
end