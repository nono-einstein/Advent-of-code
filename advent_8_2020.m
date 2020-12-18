fid = fopen('advent_7_2020.txt');
idx=1;
clear input sum
while ~feof(fid)
    input{idx} = fgetl(fid);
    idx=idx+1;
end
fclose(fid);

som=0;
for idx=1:length(input)
   som=som+length(unique(input{idx}));
end

disp(som)

fid = fopen('advent_8_2020.txt');
idx=1;
clear input2
while ~feof(fid)
    input2{idx} = fgetl(fid);
    idx=idx+1;
end
fclose(fid);


som=0;
for idx=1:length(input2)
    clear token
    loop=1;
    [token{loop},remain]=strtok(input2{idx});
    while ~isempty(remain)
        loop=loop+1;
        [token{loop},remain]=strtok(remain);
    end;
    if(idx==500)
%           keyboard;
    end
    if loop>1
        som=som+sum(filter(ones(loop-1,1),1,diff(double(sort(char(input{idx}))))==0)==(loop-1));
    else
        som=som+length(unique(char(input{idx})));
    end
end

disp(som)