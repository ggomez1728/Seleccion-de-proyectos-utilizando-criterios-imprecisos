clc % Borrar ventana de ordenes
disp('PROTOTIPO BASADO EN METODOLOGIA INTELIGENTE EN LA SELECCION EFICAZ DE IDEAS')
disp(' CON ATRIBUTOS BORROSOS PARA EL DESARROLLO DE NUEVOS PRODUCTOS')
disp('--------')
disp('permite probar la eficacia de la Metodologia mediante el procesamiento')
disp('de casos de estudio y la visualzacion de los resultados obtenidos')
disp('---------')
z3='c'; % variable indicadora de si se quiere continuar o finalizar
while z3=='c'
    entrada = menu('Indique su seleccion', 'procesar un caso', 'mostrar info sobre el prototipo', 'Finalizar')
    switch entrada
         case 1
             disp('Seleccione uno de los casos a procesar')
             z2 = input('TECLEE SU SELECCION (1,2,3,4, o 5): ','s')
             if (z2 == '1')
                disp('CASO 1')
             elseif (z2 == '2')
                disp('CASO 2')
             elseif (z2 == '3')
                disp('CASO 3')
             elseif (z2 == '4')
                disp('CASO 4')
             elseif (z2 == '5')
                disp('CASO 5')
             else
             disp('Introdujo una seleccion no incluida en el Menu de opciones;')
             disp('le mostraremos informacion sobre el prototipo')
             end
         case 2
             if z3==('c')
                disp('Continuar...')
             else
                disp('Fin de la sesion... Adios')
             end
         case 3
             disp('PROTOTIPO DE SOFTWARE PARA PROBAR LA METODOLOGIA INTELIGENTE')
             disp('EN LA SELECCION EFICAZ DE IDEAS CON ATRIBUTOS BORROSOS')
             disp('PARA EL DESARROLLO DE NUEVOS PRODUCTOS')
             disp('--------')
             disp('AUTOR: Carlos Ignacio Lameda Montero')
             disp('Version: 1.0')
             disp('Fecha de emision: marzo de 2018')
         case 4
             z3 ='f' 
             % indicador de fin de sesion
             disp('Fin de la sesion')
    end
end