function [minC, maxC] = solucionesIdeales(itemsByNumber, invalidProjects, MDNP)

    for j = 1: numel(MDNP(1, :, 1))

        IdealSolutionElements = MDNP;

        for i = 1: numel(invalidProjects)
            IdealSolutionElements(:, :, invalidProjects(i)) = [];
        end
        minC{j} = min(IdealSolutionElements(:,j,:), [], itemsByNumber);
        maxC{j} = max(IdealSolutionElements(:,j,:), [], itemsByNumber);
    end

end
