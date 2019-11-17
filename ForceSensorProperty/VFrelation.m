data = readmatrix('Measurement.xlsx','Range','A2:B11'); %import data

lambda = 0.00015:0.0001:0.002; %tuning parameter
F = linspace(0,10000);
figure;
for i=1:length(lambda)
    V = 5*(1 - exp(-lambda(i)*F));
    plot(F,V)
    hold on
    lg{i} = num2str(lambda(i));
end
lg{i+1} = 'Real Data';
scatter(data(:,1),data(:,2),'filled','r')
xlim([0,10000])
ylim([0,5])
grid on
xlabel('Force [g]')
ylabel('Voltage [V]')
legend(lg,'Location','southeast')
title('$V = 5(1-e^{-\lambda F})$','Interpreter','latex')
%%
F = linspace(0,10000,10000);
V = 0.6591*log(F)-1.2261;
figure;
plot(F,V)
hold on
scatter(data(:,1),data(:,2),'filled','r')
xlim([0,10000])
ylim([0,5])
grid on
xlabel('Force [g]')
ylabel('Voltage [V]')
legend({'$V = 0.6591\log F-1.2261$','Real Data'},'Location','southeast','Interpreter','latex')
title('V-F Curve')
%%
V = linspace(0,5,1000);
F = exp((V+1.2261)/0.6591);
figure;
plot(V,F)
hold on
scatter(data(:,2),data(:,1),'filled','r')
xlim([0,5])
ylim([0,10000])
grid on
xlabel('Voltage [V]')
ylabel('Force [g]')
legend({'$F = \exp \biggl(\frac{V+1.2261}{0.6591}\bigg)$','Real Data'},'Location','northwest','Interpreter','latex')
title('F-V Curve')