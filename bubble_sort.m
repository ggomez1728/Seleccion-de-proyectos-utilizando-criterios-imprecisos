function [cercaniaRelativa, nombreDeProyectos] = bubble_sort(cercaniaRelativa, nombreDeProyectos)
     for i = 1:  numel(cercaniaRelativa)
          for j = 1:  numel(cercaniaRelativa) - i
              if cercaniaRelativa(j) < cercaniaRelativa(j + 1)
                  partial_value = cercaniaRelativa(j);
                  partial_name = nombreDeProyectos(j);
                  cercaniaRelativa(j) = cercaniaRelativa(j + 1);
                  nombreDeProyectos(j) = nombreDeProyectos(j + 1);
                  cercaniaRelativa(j + 1) = partial_value;
                  nombreDeProyectos(j + 1) = partial_name;
              end

          end
     end
end