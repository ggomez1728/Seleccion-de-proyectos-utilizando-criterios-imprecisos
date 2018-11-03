function [ranking, nombreDeProyectos]  = eleccionDeMejoresProyectosAplicandoRestricciones(cercaniaRelativa, proyectosInvalidos, nombreDeProyectos)

% Descartamos los proyectos que no cumplieron con e)

[cercaniaRelativa, nombreDeProyectos] = remove_invalid_projects(proyectosInvalidos, cercaniaRelativa, nombreDeProyectos);

% cercaniaRelativa
% - Ordenar las ideas de acuerdo a las medidas globales de distancia
% Se dara prioridad al proyecto que tenga el valos de cercania
% relativa mas cercano a uno (1).

[ranking, nombreDeProyectos] = bubble_sort(cercaniaRelativa, nombreDeProyectos);

end