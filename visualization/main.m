%Input parameters
pin = {'A0','A1'};              %pin numbers
position = [0,4.5;0.2,-6];      %pins' positions
sigma = 1.5;                    %pressure dispersion
monitorRange = 10;              %time range of the monitor [sec]
%

load('footROI');
prompt = {'Save file name (.avi):','Measurement time [sec]:'};
dlgtitle = 'Input';
dims = [1 50];
definput = {'Gait Cycle','20'};
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
figure('units','normalized','outerposition',[.1 .05 .6 .9]);
[ax_surf,ax] = monitor(pin);
frame = 1;
time = 0;
clear F
pause(3)
tic;
while(time<=interv)
    weight = get_value(bt,length(pin)); %receive data
    surf(ax_surf,X,Y,loadMap(X,Y,weight,position,sigma,ROI),'FaceAlpha',0.5)
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
        xlabel(ax{i},'time [sec]','Interpreter','latex');
        ylabel(ax{i},'Force [kg]','Interpreter','latex');
        xticks(ax{i},linspace(0,fix(time)*frame/time,fix(time)+1))
        xticklabels(ax{i},ax{i}.XTick*time/frame)
        xlim(ax{i},[frame-frame/time*monitorRange frame])
        ax{i}.YGrid = 'on';
    end
    drawnow
    F(frame) = getframe(gcf);
    frame = frame+1;
    time = toc;
end
fprintf(bt,0);
fclose(bt);
video = VideoWriter(fname,'Uncompressed AVI');
video.FrameRate = frame/time;
open(video)
writeVideo(video,F)
close(video)