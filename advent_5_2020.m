fid = fopen('advent_4_2020.txt');
input = textscan(fid, '%s');
fclose(fid);

for idx=1:length(input{1})
   map(idx,:)= char(input{1}(idx))=='#';   
end
width = length(map(1,:));

step_x = [1 3 5 7 1];
step_y = [1 1 1 1 2] ;
sol=zeros(size(step_x));
for loop=1:length(step_x)
trees=0;
x=1;
y=1;
while y<=length(input{1})
   if (map(y,mod(x,width)+31*(mod(x,width)==0)))
       disp(['hit ,' num2str(x) ', ' num2str(y)])
       trees=trees+1;
   end
   x=step_x(loop)+x;
   y=step_y(loop)+y;
end
disp(trees)
sol(loop) = trees;
end
disp(sprintf('%12d',prod(sol)))
% valid=0;
% for idx=1:length(input{1})
%     s_idx = strfind(char(input{4}(idx)), char(input{3}(idx)));
%     if sum(s_idx == input{1}(idx)) + sum(s_idx == input{2}(idx))==1
%        disp('hit')
%        valid = valid+1;
%    end
% end
% disp(valid)