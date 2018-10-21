function [] = graficarResultados(nombreDeProyectos, ranking)

 c = categorical(nombreDeProyectos);
 bar(c,  ranking) %Grafico de barras de ranking Vs. numero de proyecto
 title ('Grafico de Barras de ranking Vs. numero de proyecto')
 xlabel (' numero de proyecto ')
 ylabel (' ranking ')
 
end