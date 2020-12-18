fid = fopen('advent_3_2020.txt');
input = textscan(fid, '%2.0f%2.0f%s%s');
fclose(fid);

valid=0;
for idx=1:length(input{1})
   if (sum(char(input{4}(idx))==char(input{3}(idx)))<=input{2}(idx) & sum(char(input{4}(idx))==char(input{3}(idx)))>=input{1}(idx))
       disp('hit')
       valid = valid+1;
   end
end
disp(valid)

valid=0;
for idx=1:length(input{1})
    s_idx = strfind(char(input{4}(idx)), char(input{3}(idx)));
    if sum(s_idx == input{1}(idx)) + sum(s_idx == input{2}(idx))==1
       disp('hit')
       valid = valid+1;
   end
end
disp(valid)