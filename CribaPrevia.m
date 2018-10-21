function [invalidProjects] = CribaPrevia(lessThatValues, similarityValues, itemsPorNumero, numeroDeProyectos, MDA)

% e.1- Descartar proyectos que tengan un valor agregado de la variable 
% lingüística V5 inferior al término lingüístico R (Regular), es decir que 
% sea inferior al número borroso triangular [0.25, 0.5, 0.75].

% Tomando como punto de comparación el centro del máximo o el promedio del
% máximo (Brunelli y Mezei 2013, p. 629; Klir y Yuan 1995, p. 337), 
% el único proyecto con  inferior al término lingüístico ?regular?  es,
% para el cual el centro del máximo es .333 

invalidProjects = [];


esMenor = true;
lessThatPositions = [5]; 

invalidProjects = discard_projects_less_than(esMenor, lessThatValues, lessThatPositions, invalidProjects, MDA);

% e.2- Descartar el proyecto que tenga el valor agregado de la variable 
% lingüística  (Grado de rentabilidad) con mayor similitud al valor 
% lingüístico MP (?Muy Pequeño?).
% Tomado como referencia la medida de similitud de Chen 
% (ver Capítulo III, p. 47) 

similarity = true;
similarityPositions = [2]; 

invalidProjects = discard_projects_by_similarity(similarity, similarityValues, similarityPositions, itemsPorNumero, numeroDeProyectos, MDA, invalidProjects);


end