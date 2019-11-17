function v = get_value(bt,pin_num)
% bluetoothから送られてきた値を拾って返す関数
v=zeros(pin_num,1);
flushinput(bt); %Remove data from input buffer
fprintf(bt,1); %bluetoothにデータを送るように指令
for i=1:pin_num
    v(i) = fscanf(bt,'%d');
    v(i) = (v(i)*5)/1023; %0~1023の値を0~5の電圧値に変更
    v(i) = exp((v(i)+1.2261)/0.6591)/1000; %電圧値を圧力値[g]に変更
end