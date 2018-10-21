function [invalidProjects] = discard_projects_by_similarity(similarity, similarityValues, similarityPositions, itemsByNumber, numberOfProjects, MDA, invalidProjects)

    lastSimilarityValue = 0;
    invalidProjectsSimilarity = [];
    if similarity  == true
        for index = 1: numel(similarityValues)
            for k = 1: numberOfProjects
                similarityAdition = 0;
                for i = 1: itemsByNumber
                   similarityAdition = similarityAdition + abs(MDA(i,similarityPositions(index),k) - similarityValues{index}(i)); 
                end
                similarityAdition = 1 - (similarityAdition / 3);
                if similarityAdition > lastSimilarityValue 
                   lastSimilarityValue = similarityAdition;
                   invalidProjectsSimilarity = k;
                elseif similarityAdition == lastSimilarityValue
                    invalidProjectsSimilarity = [invalidProjectsSimilarity k];
                end
            end
            invalidProjects = [invalidProjects invalidProjectsSimilarity];
        end
        clear invalidProjectsSimilarity;
    end

    invalidProjects = unique(invalidProjects);

    invalidProjects = sort(invalidProjects,'descend');

end