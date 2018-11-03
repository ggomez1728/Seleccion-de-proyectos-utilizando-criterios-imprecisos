% function[]= casoTGGermangomez2018v1()
% Resuelve el caso 1 seleccionado para demostrar la eficacia de la
% metodologia propuesta en la Tesis Maestria de German A. Gomez V.
% UCLA 2018.
% Basado en el ejemplo presentado en el articulo: Noiu y Chen (2009). % A New Method for Handling Fuzzy Multiple Attributes Group Decision- % Making Problems. 2009 International Conference on Advanced
% Information Technologies.
% ---------------------------------------------------------
% Autor y Programador de esta funcion: GERMAN A. GOMEZ V.
% Fecha de realizacion: 16-10-2018.
% Version: 1.0 (original).
% ---------------------------------------------------------

clear all % Deja vacio (limpia) el espacio de trabajo de MATLAB
close all % cierra las ventanas de figuras que esten abiertas

% a) Recibir información sobre el problema
    
% - Identificacion de alternativas
% 
nombreDeProyectos = ["P1", "P2", "P3", "P4", "P5", "P6",  "P7"];

% - Identificacion de decisores
nombreDeDecisores = ["D1","D2", "D3"];

% - Identificacion de criterios
nombreDeCriterios = ["C1", "C2", "C3", "C4", "C5", "C6"];

itemsPorNumero = 3; % Al ser numeros triangulares cuenta con tres numeros

%	C1 (Efectividad)
%	C2 (Rentabilidad)
% 	C3 (Seguridad)
% 	C4 (Facilidad de diseño)
% 	C5 (Extensibilidad)
% 	C6 (Novedad)

% Calculo de numeros y representaciones logicas".
% - Identificacion para alternativas
numeroDeProyectos = numel(nombreDeProyectos);
% - Identificacion para decisores
numeroDeDecisores = numel(nombreDeDecisores);
% - Identificacion para criterios
numeroDeCriterios = numel(nombreDeCriterios);

% Criterios a maximizar: todos.
% Criterios a minimizar: ninguno.
% - Representacion de criterios
% Se utiliza una escala unica de terminos linguisticos para evaluar cada
% criterio. Ademas, cada termino linguistico equivale a un numero borroso

% Nota: esto equivale a usar una escala con numero difusos
% triangulares, como se indica a continuacion:

N = [0.0, 0,0, 0.2]; % Nada
CN = [0.0, 0.2, 0.4]; % Casi Nada
M = [0.3, 0.5, 0.7]; % Medio
CT = [0.6, 0.8, 1,0]; % Casi Todo
T = [0.8, 1.0, 1.0]; % Todo

% - Premisas y Restricciones
% Premisas:
% Nota: esto equivale a usar una escala con numero difusos
% triangulares, como se indica a continuacion:

MP = [0.0, 0.0, 0.25]; % Muy Pequeño
P = [0.0, 0.25, 0.5]; % Pequeño
R = [ 0.25, 0.5, 0.75]; % Regular
A = [0.5, 0.75, 1.0]; % Alto
MA = [0.75, 1.0, 1.0]; % Muy alto

% - Asignar los vectores de peso:
% Considerando la Tabla 2 del articulo de Niou (2009),
% se tiene lo siguiente:

pesoD1 = {CT CT M M M CN};
pesoD2 = {T M M CN CN M};
pesoD3 = {CT CT CN CT M CN};

pesoD = {pesoD1; pesoD2; pesoD3};

% Restricciones:

numeroDeAlternativasaSeleccionar = 1;

% - Estalecer las matrices de decision(MD)
% Se utilizan los terminos linguisticos previamente establecidos.
% Se emplean arreglos tipo celda - Ver Chapman, S. (2008).
% MATLAB Progamming for Engineers, pp. 327-340
% y Moore, H. (2012). MATLAB for Engineers, pp. 408-409.
%
% MD1, MD2 y MD3 corresponden a la evaluacion de los criterios
% dada por los tres decisores, para cada una de las alternativas
 
MD1 = { R R R MA MA R;
        R R A A MA R; 
        A A R A A A;   
        A R R A A A; 
        P A P A MP P;
        R R R R A R;  
        R A R A A R};
    
MD2 = {A R R A MA A;
       A P A R A A;
       MA P R MA R MA;
       A A R A A A;
       P R P MA P P;
       A P R A MA A;
       MA R P R R MA};
   
MD3 = {R R A R A R;
       A P R R MA A;
       A R A A A A;
       R A P A A R;
       P A R A MP P;
       R R R A A R;
       A P R A A A };

MD = {MD1; MD2; MD3};
                  
% b) Conjuntar la informacion de la valoracion de los criterios
% - Agregar Matrices de decision de los decisores:
% MDA = matriz de decision agregada
% Se utilizara un arreglo multidimensional)
% Ver Moore, H. (2007). MATLAB para Ingenieros, pp. 352-353;
% Moore, H.(2012). MATLAB for Engineers, pp. 401-403.

MDA = ConjuntarValoracionDeCriteriosDifusos(numeroDeProyectos, numeroDeCriterios, numeroDeDecisores, MD);

% c) Establecer los pesos que correspondan a cada uno de
% los criterios considerados
% - Agregar vectores de peso:

MDNP = ConjuntarPonderaciondeCriteriosDifusos(pesoD,  MDA);

% MDNP
% e) Descartar proyectos fuera de especificacion:

menorQuePremisas = {R};         %podemos agregar mas regras
similarityValues = {MP};        %podemos agregar mas regras
proyectosInvalidos = CribaPrevia(menorQuePremisas, similarityValues, itemsPorNumero, numeroDeProyectos, MDA);

% f) Ordenar jerárquicamente las ideas examinadas, con base
% en medidas ponderadas y agregadas obtenidas previamente

cercaniaRelativa  = JerarquizacionDeProyectos(itemsPorNumero, proyectosInvalidos, MDNP);

% g) Seleccionar la mejor proyecto
%
% Nota: se supondra que si hay un empate en el primer lugar,
% se escogera, de entre las mejores, la primera en la lista de
% alternativas a seleccionar.
% Dado que el indice del ranking coincide con la
% identificacion de proyecto, el elemento con valor uno (1)
% tiene un indice gual al numero que identifica a cada proyecto

%[y, mejorAlternativa] = min(cercaniaRelativa);


[ranking, nombreDeProyectos]  = eleccionDeMejoresProyectosAplicandoRestricciones(cercaniaRelativa, proyectosInvalidos, nombreDeProyectos);

% Extra: Presentar los resultados obtenidos

imprimirResultados(nombreDeProyectos, ranking)
    
% Representacion de lineas para secuencias de datos discretos
% stem(cercaniaRelativa)
% Grafico de tallos de distancias Vs. numero de proyecto
% ---------------------
graficarResultados(nombreDeProyectos, ranking)

