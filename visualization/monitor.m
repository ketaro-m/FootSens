function [ax_surf,ax] = monitor(n,pin)
% create subplot
tmp=[];
for i=1:n
    for j=1:fix(n/2)
        tmp = [tmp,(i-1)*(fix(n/2)+1)+j];
    end
end
ax_surf = subplot(n,fix(n/2)+1,tmp);
for i=1:n
    ax{i} = subplot(n,fix(n/2)+1,(fix(n/2)+1)*i);
    title(ax{i},pin{i})
end