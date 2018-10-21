function [dSI, dSNI] = distanciaASolucionesIdeales(maxC, minC, MDNP)
    for k = 1: numel(MDNP(1,:,1)) %Numero de criterios
            dSI{k} = calculate_distance_projects(maxC{k}, MDNP(:, k, :));
            dSNI{k} = calculate_distance_projects(minC{k}, MDNP(:, k, :));
    end
end

function [distance] = calculate_distance_projects(maxC_Array, MDNP_Array)
    for i = 1: numel(MDNP_Array(1, 1, :))
        distance(i) = calculate_distance_project(maxC_Array, MDNP_Array(:, 1, i));
    end
end

function [distance] = calculate_distance_project(maxC_Array, MDNP_Project)
    distance = 0;
    for i = 1: numel(MDNP_Project(:, 1))
        maxC_Array(i)
        MDNP_Project(i)
       distance = distance + (maxC_Array(i) - MDNP_Project(i))^2;
    end
    distance = sqrt(distance/3);
end
