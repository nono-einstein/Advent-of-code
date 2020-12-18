function [ list ] = advent_9b_2020_search_bags( input, list )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

for loop2=1:length(list)
    loop=1;
    for idx=1:length(input)
        if regexp(input{idx},list{loop2}.color)==1
            disp(input{idx})
            % make first list of bags First the 'golden' bag
            [token, rem]=strtok(input{idx},':');
            rem=strrep(rem,':', ',');
            [token, rem]=strtok(rem,',');
            [token2, rem2]=strtok(token,' ');
            if str2num(token2)>0
                list{loop2}.list{loop}.n=str2num(token2);
                list{loop2}.list{loop}.color=strtrim(rem2);
                loop=loop+1;
            end
            while ~isempty(rem)
                [token, rem]=strtok(rem,',');
                [token2, rem2]=strtok(token,' ');
                if str2num(token2)>0
                    list{loop2}.list{loop}.n=str2num(token2);
                    list{loop2}.list{loop}.color=strtrim(rem2);
                    loop=loop+1;
                end
            end
        end
    end
    if loop>1
        list{loop2}.list = advent_9b_2020_search_bags( input, list{loop2}.list );
    end
end
end

