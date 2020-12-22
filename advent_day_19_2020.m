clear all;

fid = fopen('advent_day_19_2020b.txt');
idx=1;
ready = 0;
clear rules input
while ~ready
    temp = fgetl(fid);
    if isempty(temp)
        ready = 1;
    else
        idx2=str2num(strtok(temp,':'))+1;
        rules{idx2}=temp;
    end
    idx=idx+1;
end

idx=1;
while ~feof(fid)
    input{idx} = fgetl(fid);
    idx=idx+1;
end
fclose(fid);

% make map of rules
rule=zeros(10);
for idx=1:length(rules)
    [~,remstr]=strtok(rules{idx},':');
    temp=textscan(remstr,'%s');
    temp{1}(1)=[];
    switch(length(temp{1}(:)))
        case(1)
            if strfind(char(temp{1}(1)),'"a"')
                rules{idx}='a';
            elseif strfind(char(temp{1}(1)),'"b"')
                rules{idx}='b';
            else
                rule(1)=str2num(char(temp{1}(1)))+1;
                rules{idx}=sprintf(' %d ',rule(1));
            end
        case{2,3,4,5,6,7,8,9}
            if any(cell2mat(strfind(temp{:},'|')))
                tempa=[];
                tempb=[];
                pipe_seen=0;
                for idx2=1:length(temp{1})
                    if strcmp(temp{1}(idx2),'|')
                        pipe_seen=1;
                    else
                        if pipe_seen
                            tempb(end+1)= str2num(char(temp{1}(idx2)))+1;
                        else
                            tempa(end+1)= str2num(char(temp{1}(idx2)))+1;
                        end
                    end
                end
                rules{idx}=['( ' sprintf(' %d ',tempa) ' | ' sprintf(' %d ',tempb) ')'];
            else
                tempa=[];
                for idx2=1:length(temp{1})
                    tempa(end+1)= str2num(char(temp{1}(idx2)))+1;
                end
                rules{idx}=sprintf(' %d ',tempa);
            end
     end
end




for loop=1:10
    rep_idx=zeros(length(rules),1);
    rep_str=[];
    loop2=0;
    for idx=1:length(rules)
        if isempty(regexp(rules{idx},'[0123456789]'))
            loop2=loop2+1;
            rep_idx(loop2)=idx;
            rep_str{loop2}=sprintf(' %s ',rules{idx});
        end
    end
    if loop2
        for idx=1:length(rules)
            for idx2=1:loop2
                rules{idx}=strrep(rules{idx},sprintf(' %d ',rep_idx(idx2)),rep_str{idx2});
            end
        end
    end
end

if 0
    valid = 0;
    for idx=1:length(input)
        if 1==(strcmp(regexp(input{idx},strrep(rules{1},' ',''),'match'), input{idx}))
            valid = valid+1;
        end
    end
    
    disp(valid)
end

if (1)
    % deel 2 new rules
    valid = zeros(length(input),1);
    for loop=1:48 %los bepaald
        new_rules=[ '(' strrep(rules{43},' ','') ')+'  ...
            '(' strrep(rules{43},' ','') sprintf('){%d}', loop)  ...
            '(' strrep(rules{32},' ','') sprintf('){%d}', loop) ] ;
        for idx=1:length(input)
            if 1==(strcmp(regexp(input{idx},new_rules,'match'), input{idx}))
                valid(idx) = 1;
            end
        end
        disp(sum(valid))
    end
    disp(sum(valid))
end
