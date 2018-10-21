function [dGS] =  global_ideal_distances(dSI)
    numberOfCriteria = numel(dSI);
    numberOfProjects = numel(dSI{1}(:));
    dGS = zeros(1 ,numberOfProjects);
    for j=1 : numberOfCriteria
       for k=1 : numberOfProjects
          dGS(k) = dGS(k) + dSI{j}(k);
       end 
    end
end