pin = {'A0','A1'}; %used pins
position = [0,6;0,-6]; %pins' positions
sigma = 2; %pressure dispersion

prompt = {'Save file name (.avi):','Measurement time:'};
dlgtitle = 'Input';
dims = [1 50];
definput = {'Gait Cycle','50'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
fname = answer{1};
interv = str2double(answer{2});

if strcmp(bt.Status,'closed')
    fopen(bt);
end
fprintf(bt,0);
x = -5:0.1:5;
y = -10:0.1:10;
[X,Y] = meshgrid(x,y);
n = length(pin);
data = cell(n,1);
figure('units','normalized','outerposition',[.05 .05 .75 .9]);
[ax_surf,ax] = monitor(pin);
frame = 1;
clear F
pause(3)
while(frame<=interv)
    weight = get_value(bt,length(pin)); %receive data
    surf(ax_surf,X,Y,loadMap(X,Y,weight,position,sigma),'FaceAlpha',0.5)
    colormap(ax_surf,jet)
    colorbar(ax_surf)
    xticks(ax_surf,[])
    yticks(ax_surf,[])
    caxis(ax_surf,[0,8])
    zlim(ax_surf,[0,10])
    view(ax_surf,2)
    title(ax_surf,'Heat Map','Interpreter','latex')
    for i=1:n
        data{i} = [data{i},weight(i)];
        plot(ax{i},data{i})
        ylim(ax{i},[0,10])
        title(ax{i},pin{i},'Interpreter','latex')
        xlabel(ax{i},'time','Interpreter','latex');
        ylabel(ax{i},'Force [kg]','Interpreter','latex');
        grid(ax{i},'on')
    end
    drawnow
    F(frame) = getframe(gcf);
    frame = frame+1;
end
fprintf(bt,0);
fclose(bt);
video = VideoWriter(fname,'Uncompressed AVI');
video.FrameRate = 10;
open(video)
writeVideo(video,F)
close(video)