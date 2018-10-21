function [] = imprimirResultados(nombreDeProyectos, ranking)

    disp(' +++++++++++++++++++++++++++++++++++++++++++++ ')
    disp(' Tabla De Resultados ' )
    disp(' Proyecto cercania relativa ranking')

    for i = 1: numel(nombreDeProyectos)
         fprintf(' %2s %6.4f \n',...
         nombreDeProyectos(i),ranking(i))
    end
    disp(' +++++++++++++++++++++++++++++++++++++++++++++ ')
    disp(' ')
    
end