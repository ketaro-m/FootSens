data = readmatrix('Measurement.xlsx','Sheet','Actual Testing','Range','A2:B13'); %import data
%%
%V-F Curve
F = linspace(0,10000,10000);
V = 0.7687*log(F)-2.0269;
figure;
plot(F,V)
hold on
scatter(data(:,1),data(:,2),'filled','r')
xlim([0,10000])
ylim([0,5])
grid on
xlabel('Force [g]')
ylabel('Voltage [V]')
legend({'$V = 0.7687\log F-2.0269$','Real Data'},'Location','southeast','Interpreter','latex')
title('V-F Curve')
%%
%F-V Curve
V = linspace(0,5,1000);
F = exp((V+2.0269)/0.7687);
figure;
plot(V,F)
hold on
scatter(data(:,2),data(:,1),'filled','r')
xlim([0,5])
ylim([0,10000])
grid on
xlabel('Voltage [V]')
ylabel('Force [g]')
legend({'$F = \exp \biggl(\frac{V+2.0269}{0.7687}\bigg)$','Real Data'},'Location','northwest','Interpreter','latex')
title('F-V Curve')