fid = fopen('advent_9_2020.txt');
idx=1;
clear input sum
while ~feof(fid)
    input{idx} = fgetl(fid);
    idx=idx+1;
end
fclose(fid);

old_loop=1;
old_loop_start=1;
loop=1;
for idx=1:length(input)
   if regexp(input{idx},'shiny gold')>1
       disp(input{idx})
       list{loop}=strtrim(strtok(input{idx},':'));
       loop=loop+1;
   end
end
while old_loop < loop
    old_loop=loop;
    for idx2=old_loop_start:old_loop-1
        for idx=1:length(input)
            if regexp(input{idx},list{idx2})>1
                disp(input{idx})
                list{loop}=strtrim(strtok(input{idx},':'));
                loop=loop+1;
            end
        end
    end
    old_loop_start = old_loop;
end

display(length(unique(list)))

