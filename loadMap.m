function Z = loadMap(X,Y,weight,position,sigma)
if length(weight)~=size(position,1)
    msg = 'Invalid input size.';
    error(msg)
end
tmp = gaussC(X,Y,sigma,position(1,:));
for i=2:length(weight)
    tmp = cat(3,tmp,gaussC(X,Y,sigma,position(i,:)));
end
tmp = tmp.*reshape(weight,[1,1,length(weight)]);
Z = sum(tmp,3);