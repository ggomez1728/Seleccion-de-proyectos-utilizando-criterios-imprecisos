function [ranking, nombreDeProyectos]  = JerarquizacionDeProyectos(itemsPorNumero, proyectosInvalidos, MDNP, nombreDeProyectos)
    
% f.1) Establecer puntos de comparacion:

% Se conviene en utilizar como punto de comparacion la solucion 
% positiva ideal y la solucion negativa ideal.
% Solucion Positiva ideal: La que contiene el maximo de cada columna.
% Solucion Negativa ideal: La que contiene el minimo de cada columna.

%  Solucion Negativa ideal = minC; Solucion Positiva ideal = maxC.

[minC, maxC] = solucionesIdeales(itemsPorNumero, proyectosInvalidos, MDNP);

% - Determinar medidas de distancia
% Se determina la distancia a la solucion ideal (dSI),
% y la distancia a la % solucion negativa ideal (dSNI):

[dSI, dSNI] = distanciaASolucionesIdeales(maxC, minC, MDNP);


% Luego se calcula las distancias globales a la
% solucion ideal (dGSI) y a la % solucion negativa ideal (dGSNI)
% para cada una de las alternativas:

[dGSI] =  global_ideal_distances(dSI);
[dGSNI] =  global_ideal_distances(dSNI);
    
% dGSI
% dGSNI
% Despues se calcula, para cada proyecto, la medida denominada
% cercania relativa a la solucion ideal (o preferencia global):

cercaniaRelativa = relative_closeness(dGSI, dGSNI);


% Descartamos los proyectos que no cumplieron con e)

[cercaniaRelativa, nombreDeProyectos] = remove_invalid_projects(proyectosInvalidos, cercaniaRelativa, nombreDeProyectos);

% cercaniaRelativa
% - Ordenar las ideas de acuerdo a las medidas globales de distancia
% Se dara prioridad al proyecto que tenga el valos de cercania
% relativa mas cercano a uno (1).

[ranking, nombreDeProyectos] = bubble_sort(cercaniaRelativa, nombreDeProyectos);
   

end