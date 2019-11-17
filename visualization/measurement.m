mesh = 0.25; %meshÇÃç◊Ç©Ç≥
x = -5:mesh:5;
y = -10:mesh:10;
position = [0,6;0,-6];
[X,Y] = meshgrid(x,y);
pin = {'A0','A1'};

prompt = {'Save file name (.avi):','Measurement time:'};
dlgtitle = 'Input';
dims = [1 50];
definput = {'Gait Cycle','50'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
fname = answer{1};
interv = str2double(answer{2});

n = length(pin);
data = cell(n,1);
figure('units','normalized','outerposition',[.05 .05 .75 .9]);
[ax_surf,ax] = monitor(n,pin);
fclose(bt);
frame = 1;
clear F
while(frame<=interv)
    weight = get_value(bt,length(pin)); %receive data
    surf(ax_surf,X,Y,loadMap(X,Y,weight,position,4),'FaceAlpha',0.5)
    colormap(ax_surf,jet)
    colorbar(ax_surf)
    xticks(ax_surf,[])
    yticks(ax_surf,[])
    caxis(ax_surf,[0,10])
    zlim(ax_surf,[0,10])
    view(ax_surf,2)
    title(ax_surf,'Heat Map','Interpreter','latex')
    for i=1:n
        data{i} = [data{i},weight(i)];
        plot(ax{i},data{i})
        ylim(ax{i},[0,10])
        title(ax{i},pin{i})
        xlabel(ax{i},'time','Interpreter','latex');
        ylabel(ax{i},'Force [kg]','Interpreter','latex');
        grid(ax{i},'on')
    end
    drawnow
    F(frame) = getframe(gcf);
    frame = frame+1;
end
video = VideoWriter(fname,'Uncompressed AVI');
video.FrameRate = 10;
open(video)
writeVideo(video,F)
close(video)