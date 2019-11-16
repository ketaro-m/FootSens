function v = get_value(bt,pin_num)
% bluetooth‚©‚ç‘—‚ç‚ê‚Ä‚«‚½’l‚ğE‚Á‚Ä•Ô‚·ŠÖ”
v=zeros(pin_num,1);
fopen(bt);
fprintf(bt,1); %
for i=1:pin_num
    v(i) = fscanf(bt,'%d');
end
fclose(bt);