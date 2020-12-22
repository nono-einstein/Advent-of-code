function [ lijst ] = advent_day_19_generate_list( idx, rule, directions )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
index=[1 2;3 4];
lijst=[];
loop=1;
for idx2=1:length(rule(idx,index(directions(1),:)))
    if rule(idx,index(directions(1),idx2)) <0
        lijst(end+1)=rule(idx,index(directions(1),idx2));
    elseif rule(idx,index(directions(1),idx2)) >0
        [ sub_lijst ] = advent_day_19_generate_list( ...
            rule(idx,index(directions(1),idx2)), ...
            rule, directions(1+loop:end));
        lijst(end+1:end+length(sub_lijst))=sub_lijst;
        loop=loop+1;
    else
        %0, do nothing
    end
end

