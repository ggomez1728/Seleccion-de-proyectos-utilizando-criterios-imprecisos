function [invalidProjects] = CribaPrevia(lessThatValues, similarityValues, itemsPorNumero, numeroDeProyectos, MDA)

% e.1- Descartar proyectos que tengan un valor agregado de la variable 
% ling��stica V5 inferior al t�rmino ling��stico R (Regular), es decir que 
% sea inferior al n�mero borroso triangular [0.25, 0.5, 0.75].

% Tomando como punto de comparaci�n el centro del m�ximo o el promedio del
% m�ximo (Brunelli y Mezei 2013, p. 629; Klir y Yuan 1995, p. 337), 
% el �nico proyecto con  inferior al t�rmino ling��stico ?regular?  es,
% para el cual el centro del m�ximo es .333 

invalidProjects = [];


esMenor = true;
lessThatPositions = [5]; 

invalidProjects = discard_projects_less_than(esMenor, lessThatValues, lessThatPositions, invalidProjects, MDA);

% e.2- Descartar el proyecto que tenga el valor agregado de la variable 
% ling��stica  (Grado de rentabilidad) con mayor similitud al valor 
% ling��stico MP (?Muy Peque�o?).
% Tomado como referencia la medida de similitud de Chen 
% (ver Cap�tulo III, p. 47) 

similarity = true;
similarityPositions = [2]; 

invalidProjects = discard_projects_by_similarity(similarity, similarityValues, similarityPositions, itemsPorNumero, numeroDeProyectos, MDA, invalidProjects);


end