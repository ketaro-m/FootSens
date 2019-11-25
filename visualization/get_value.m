function v = get_value(bt,pin_num)
% this function returns the velues sent from bluetooth
v=zeros(pin_num,1);
flushinput(bt); %remove data from input buffer
fprintf(bt,1); 
for i=1:pin_num
    v(i) = fscanf(bt,'%d');
    v(i) = (v(i)*5)/1023; %convert analog input 0~1023 to 0~5
    v(i) = exp((v(i)+1.2261)/0.6591)/1000; %convert voltage[V] to pressure[kg]
end