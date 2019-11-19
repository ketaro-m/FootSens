function [ax_surf,ax] = monitor(pin)
% create subplot
n = length(pin);
tmp=[];
for i=1:n
    for j=1:fix(n/2)
        tmp = [tmp,(i-1)*(fix(n/2)+1)+j];
    end
end
ax_surf = subplot(n,fix(n/2)+1,tmp);
title(ax_surf,'Heat Map','Interpreter','latex')
xticks(ax_surf,[])
yticks(ax_surf,[])
for i=1:n
    ax{i} = subplot(n,fix(n/2)+1,(fix(n/2)+1)*i);
    title(ax{i},pin{i},'Interpreter','latex')
    xticks(ax{i},[])
    yticks(ax{i},[])
end