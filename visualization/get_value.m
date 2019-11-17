function v = get_value(bt,pin_num)
% bluetoothから送られてきた値を拾って返す関数
v=zeros(pin_num,1);
fopen(bt);
fprintf(bt,1); %
for i=1:pin_num
    v(i) = fscanf(bt,'%d');
    v(i)= (v(i)*5)/1023; %0~1023の値を0~5の電圧値に変更
end
fclose(bt);