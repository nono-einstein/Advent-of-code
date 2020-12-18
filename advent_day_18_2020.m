clear all;

fid = fopen('advent_day_18_2020.txt');
idx=1;
clear input sum
while ~feof(fid)
    input{idx} = fgetl(fid);
    bra(idx)=length(strfind(input{idx},'('));
    idx=idx+1;
end
fclose(fid);

opgave = 1;

for idx=1:length(input)
    cur_input = input{idx};
    while ~isempty(strfind(cur_input,'('))
        first = strfind(cur_input,'(');
        last = strfind(cur_input(first(end)+1:end),')');
        to_parse=cur_input(first(end)+1:first(end)+last(1)-1);
        %% parse single string %%
        [ num1 ] = advent_day_18_parse_b( to_parse, opgave );
        cur_input = [cur_input(1:first(end)-1) ' ' num2str(num1) ' ' cur_input(first(end)+last(1)+1:end)];
    end
    %% cur input without brackets, parse completely
    %% parse single string %%
    [ num1 ] = advent_day_18_parse_b( cur_input, opgave );
    sommetje(idx) = num1;
end

sprintf('%20d', sum(sommetje))



