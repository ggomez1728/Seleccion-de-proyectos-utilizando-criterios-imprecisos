function [cercaniaRelativa, nombreDeProyectos] = remove_invalid_projects(invalidProjects, cercaniaRelativa, nombreDeProyectos)
    for i = 1: numel(invalidProjects)
        cercaniaRelativa(invalidProjects(i)) = [];
        nombreDeProyectos(invalidProjects(i)) = [];
    end
end