function v = get_value(bt,pin_num)
% bluetooth���瑗���Ă����l���E���ĕԂ��֐�
v=zeros(pin_num,1);
flushinput(bt); %Remove data from input buffer
fprintf(bt,1); %bluetooth�Ƀf�[�^�𑗂�悤�Ɏw��
for i=1:pin_num
    v(i) = fscanf(bt,'%d');
    v(i) = (v(i)*5)/1023; %0~1023�̒l��0~5�̓d���l�ɕύX
    v(i) = exp((v(i)+1.2261)/0.6591)/1000; %�d���l�����͒l[g]�ɕύX
end