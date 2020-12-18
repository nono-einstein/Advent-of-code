fid = fopen('advent_5_2020.txt');
idx=1;
while ~feof(fid)
    input{idx} = fgetl(fid);
    idx=idx+1;
end
fclose(fid);

keys={'cid','pid','hgt','hcl','ecl','byr','iyr','eyr'};
keysn=[0 1 1 1 1 1 1 1 1];
pasvalid = 0;
for idx=1:length(input)
    for idx_key=1:length(keys)
        pas(idx).([char(keys(idx_key))])=strtok(input{idx}(findstr(input{idx}, char(keys(idx_key)))+length(char(keys(idx_key))):end), ': ');
    end
    valid = 1;
    for idx_key=1:length(keys)
        if keysn(idx_key)
            if isempty(pas(idx).([char(keys(idx_key))]))
                valid=0;
            end
        end
    end
    pasvalid=pasvalid+valid;
end
disp(pasvalid)




keys={'cid','pid','hgt','hcl','ecl','byr','iyr','eyr'};
keysn=[0 1 1 1 1 1 1 1 1];
pasvalid = 0;
for idx=1:length(input)
    pas(idx).hclvalid =1;
    pas(idx).pidvalid =1;
    pas(idx).eclvalid =1;
    pas(idx).hgtvalid =1;
    pas(idx).byrvalid =1;
    pas(idx).iyrvalid =1;
    pas(idx).eyrvalid =1;
    for idx_key=1:length(keys)
        pas(idx).([char(keys(idx_key))])=strtok(input{idx}(findstr(input{idx}, char(keys(idx_key)))+length(char(keys(idx_key))):end), ': ');
    end
    valid = 1;
    for idx_key=1:length(keys)
        if keysn(idx_key)
            if isempty(pas(idx).([char(keys(idx_key))]))
                valid=0;
            end
        end
    end
    if valid
        % hcl
        if length(regexp(char(pas(idx).hcl),'#'))~=1
            valid = 0;
            pas(idx).hclvalid =0;
        elseif length(regexp(char(pas(idx).hcl),'[0-9|a-f]'))~=6
            valid = 0;
            pas(idx).hclvalid =0;
        end
        %        if ~valid
        %            disp('hcl')
        %        end
        % pid
        if length(regexp(char(pas(idx).pid),'[0-9]'))~=9
            valid = 0;
            pas(idx).pidvalid =0;
        end
        %        if ~valid
        %            disp('pid')
        %        end
        % byr
        if length(regexp(char(pas(idx).byr),'[0-9]'))~=4
            valid = 0;
            pas(idx).byrvalid =0;
        else
            if str2num(char(pas(idx).byr))< 1920
                valid = 0;
                pas(idx).byrvalid =0;
            elseif str2num(char(pas(idx).byr))> 2002
                valid = 0;
                pas(idx).byrvalid =0;
            end
        end
        %        if ~valid
        %            disp('byr')
        %        end
        % iyr
        if length(regexp(char(pas(idx).iyr),'[0-9]'))~=4
            valid = 0;
            pas(idx).iyrvalid =0;
        else
            if str2num(char(pas(idx).iyr))< 2010
                valid = 0;
                pas(idx).iyrvalid =0;
            elseif str2num(char(pas(idx).iyr))> 2020
                valid = 0;
                pas(idx).iyrvalid =0;
            end
        end
        %        if ~valid
        %            disp('iyr')
        %        end
        % eyr
        if length(regexp(char(pas(idx).eyr),'[0-9]'))~=4
            valid = 0;
            pas(idx).eyrvalid =0;
        else
            if str2num(char(pas(idx).eyr))< 2020
                valid = 0;
                pas(idx).eyrvalid =0;
            elseif str2num(char(pas(idx).eyr))> 2030
                valid = 0;
                pas(idx).eyrvalid =0;
            end
        end
        %        if ~valid
        %            disp('eyr')
        %        end
        % ecl
        if isempty(regexp(char(pas(idx).ecl),'{|amb|blu|brn|gry|grn|hzl|oth|}'))
            valid = 0;
            pas(idx).eclvalid =0;
        end
        %        if ~valid
        %            disp('ecl')
        %        end
        % hgt
        if regexp(char(pas(idx).hgt),'cm')
            if length(regexp(char(pas(idx).hgt(1:regexp(char(pas(idx).hgt),'cm')-1)),'[0-9]'))
                if str2num(char(pas(idx).hgt(1:regexp(char(pas(idx).hgt),'cm')-1)))<150
                    valid = 0;
                    pas(idx).hgtvalid =0;
                elseif str2num(char(pas(idx).hgt(1:regexp(char(pas(idx).hgt),'cm')-1)))>193
                    valid = 0;
                    pas(idx).hgtvalid =0;
                end
            else
                valid = 0;
                pas(idx).hgtvalid =0;
            end
        elseif regexp(char(pas(idx).hgt),'in')
            if length(regexp(char(pas(idx).hgt(1:regexp(char(pas(idx).hgt),'in')-1)),'[0-9]'))
                if str2num(char(pas(idx).hgt(1:regexp(char(pas(idx).hgt),'in')-1)))<59
                    valid = 0;
                    pas(idx).hgtvalid =0;
                elseif str2num(char(pas(idx).hgt(1:regexp(char(pas(idx).hgt),'in')-1)))>76
                    valid = 0;
                    pas(idx).hgtvalid =0;
                end
            else
                valid = 0;
                pas(idx).hgtvalid =0;
            end
        else
            valid = 0;
            pas(idx).hgtvalid =0;
        end
        %        if ~valid
        %            disp('hgt')
        %        end
    end
    if valid
        pas(idx).valid =1;
    else
        pas(idx).valid =0;
    end
    pasvalid=pasvalid+valid;
end
disp(pasvalid)