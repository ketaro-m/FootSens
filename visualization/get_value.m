function v = get_value(bt,pin_num)
% bluetooth���瑗���Ă����l���E���ĕԂ��֐�
v=zeros(pin_num,1);
fopen(bt);
fprintf(bt,1); %
for i=1:pin_num
    v(i) = fscanf(bt,'%d');
end
fclose(bt);