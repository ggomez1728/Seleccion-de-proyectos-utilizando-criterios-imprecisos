function [DRC] = relative_closeness(dGSI, dGSNI)
 nombreDeProyectos =  numel(dGSI);
for i = 1: nombreDeProyectos
    DRC(i) = dGSNI(i) / ( dGSI(i) + dGSNI(i) );
end

end
